class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items 
  has_many :invoices 
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def self.most_revenue(x)
    joins(invoices: [:transactions, :invoice_items])
    .where("transactions.result = ?", "success")
    .select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as total_revenue")
    .group("merchants.id")
    .reorder("total_revenue desc")
    .limit(x)
  end

  def self.most_items(x)
    select("merchants.*, SUM(invoice_items.quantity) as total_items")
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: "success"}).group(:id)
    .order("total_items desc")
    .limit(x)
  end
end
