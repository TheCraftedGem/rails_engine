class Invoice < ApplicationRecord
  validates_presence_of :customer_id, :merchant_id, :status

  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :transactions
  has_many :items, through: :invoice_items


  def self.revenue_by_date(date)
    select("SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue").
      joins(:invoice_items, :transactions).
      merge(Transaction.unscoped.successful).
      group("invoice_items.id").
      where("cast(invoices.created_at AS text) Like #{date}").
      pluck("SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue").
      sum
  end

  def self.best_day(x)
    select("invoices.created_at, sum(invoice_items.quantity) AS units")
      .joins(:invoice_items)
      .where("invoice_items.item_id = #{x}")
      .group("invoices.id")
      .order("units desc, invoices.created_at desc")
      .first
  end
end
