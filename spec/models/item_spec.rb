require 'rails_helper'

RSpec.describe Item, type: :model do

  describe "Item's Best Day Request" do

  #   it 'should return ' do
  #     merch_id = create(:merchant).id
  #     cust_id = create(:customer).id
  #     item_id = create(:item, merchant_id: merch_id).id

  #     i_1 = create(:invoice, customer_id: cust_id, merchant_id: merch_id, created_at: '2012-03-25 14:53:59 UTC')
  #     i_2 = create(:invoice, customer_id: cust_id, merchant_id: merch_id, created_at: '2012-03-26 14:53:59 UTC')
  #     i_3 = create(:invoice, customer_id: cust_id, merchant_id: merch_id, created_at: '2012-03-27 14:53:59 UTC')
  #     i_4 = create(:invoice, customer_id: cust_id, merchant_id: merch_id, created_at: '2012-03-28 14:53:59 UTC')
  #     i_5 = create(:invoice, customer_id: cust_id, merchant_id: merch_id, created_at: '2012-03-29 14:53:59 UTC')

  #     i_i_1 = create(:invoice_item, invoice_id: i_1.id, item_id: item_id, quantity: 1)
  #     i_i_2 = create(:invoice_item, invoice_id: i_2.id, item_id: item_id, quantity: 2)
  #     i_i_3 = create(:invoice_item, invoice_id: i_3.id, item_id: item_id, quantity: 3)
  #     i_i_4 = create(:invoice_item, invoice_id: i_4.id, item_id: item_id, quantity: 4)
  #     i_i_5 = create(:invoice_item, invoice_id: i_5.id, item_id: item_id, quantity: 5)

  #     get "/api/v1/items/#{item_id}/best_day"

  #     best_date = JSON.parse(response.body)["best_day"]
  #     best_datetime = Time.zone.parse(best_date)
      
  #     expect(best_datetime).to eq(i_5["created_at"])
  #   end
  # end
  end
end
