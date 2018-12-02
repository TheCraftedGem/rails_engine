require 'rails_helper'

RSpec.describe Item, type: :model do

  describe "Item's Best Day" do

  it '.best_day' do
    merchant1 = create(:merchant, name: 'Andy')
    merchant2 = create(:merchant, name: 'Bob')
    merchant3 = create(:merchant, name: 'Charles')
    merchant4 = create(:merchant, name: 'Dave')
    item1 = create(:item, merchant: merchant1)
    invoice1 = create(:invoice, merchant: merchant1, created_at: "2018-08-01 09:00:00 UTC")
    invoice2 = create(:invoice, merchant: merchant2, created_at: "2018-08-02 09:00:00 UTC")
    invoice3 = create(:invoice, merchant: merchant3, created_at: "2018-08-03 09:00:00 UTC")
    invoice4 = create(:invoice, merchant: merchant4, created_at: "2018-08-04 09:00:00 UTC")
    invoice_item1 = create(:invoice_item, quantity: 1, unit_price: 100, invoice: invoice1, item: item1)
    invoice_item2 = create(:invoice_item, quantity: 5, unit_price: 100, invoice: invoice2, item: item1)
    invoice_item3 = create(:invoice_item, quantity: 20, unit_price: 100, invoice: invoice3, item: item1)
    invoice_item4 = create(:invoice_item, quantity: 20, unit_price: 100, invoice: invoice4, item: item1)
    transaction1 = create(:transaction, invoice: invoice1, result: 'success')
    transaction2 = create(:transaction, invoice: invoice2, result: 'success')
    transaction3 = create(:transaction, invoice: invoice3, result: 'success')
    transaction4 = create(:transaction, invoice: invoice4, result: 'success')

    actual = Item.best_day(item1.id)
    expect(actual[0]["created_at"]).to eq(invoice4.created_at)
  end

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
