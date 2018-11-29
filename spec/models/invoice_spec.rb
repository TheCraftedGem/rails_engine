require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'Instance Methods' do
    xit '#best_day' do
      merchant = create(:merchant)

      customer = create(:customer)

      item = create(:item, merchant_id: merchant.id)

      day_1 = '2012-03-16'
      day_2 = '2012-04-17'

      invoice_1 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id, created_at: day_1)
      invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id, created_at: day_1)
      invoice_3 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id, created_at: day_2)

      create_list(:invoice_item, 5, item_id: item.id, invoice_id: invoice_1.id)
      create_list(:invoice_item, 3, item_id: item.id, invoice_id: invoice_2.id)
      create_list(:invoice_item, 1, item_id: item.id, invoice_id: invoice_3.id)

      create(:transaction, invoice_id: invoice_1.id)
      create(:transaction, invoice_id: invoice_2.id)
      create(:transaction, invoice_id: invoice_3.id)
      create(:transaction, result: 'failed', invoice_id: invoice_3.id)

      expect(merchant.best_day(day_1)).to eq(day_1)
    end
  end
end
