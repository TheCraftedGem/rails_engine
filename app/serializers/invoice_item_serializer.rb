class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :item_id, :invoice_id, :quantity 
  
  attributes :unit_price do |object|
    object.unit_price.to_f / 100
  end
end