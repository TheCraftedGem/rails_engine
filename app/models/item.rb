class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price, :merchant_id

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.best_day(x)
    Invoice.select("invoices.created_at, sum(invoice_items.quantity) AS units")
    .joins(:invoice_items)
    .where("invoice_items.item_id = #{x}")
    .group("invoices.id")
    .order("units desc, invoices.created_at desc")
    .limit(1)
  end
  
end
