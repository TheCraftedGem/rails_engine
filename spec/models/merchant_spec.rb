require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'Relationships' do
    it {should have_many :items}
    it {should have_many :invoices}
    it {should have_many(:transactions).through(:invoices)}
    it {should have_many(:invoice_items).through(:invoices)}
    it {should have_many(:customers).through(:invoices)}
  end
 
  describe 'business intel' do
    it ".most_revenue" do
      merchant1 = create(:merchant, name: 'Angie')
      merchant2 = create(:merchant, name: 'Glen')
      merchant3 = create(:merchant, name: 'Mark')
      merchant4 = create(:merchant, name: 'Booth')
      invoice1 = create(:invoice, merchant: merchant1)
      invoice2 = create(:invoice, merchant: merchant2)
      invoice3 = create(:invoice, merchant: merchant3)
      invoice4 = create(:invoice, merchant: merchant4)
      item1 = create(:item, merchant: merchant1)
      item2 = create(:item, merchant: merchant2)
      item3 = create(:item, merchant: merchant3)
      item4 = create(:item, merchant: merchant4)
      invoice_item1 = create(:invoice_item, quantity: 1, unit_price: 100, invoice: invoice1, item: item1)
      invoice_item2 = create(:invoice_item, quantity: 1, unit_price: 200, invoice: invoice2, item: item2)
      invoice_item3 = create(:invoice_item, quantity: 10, unit_price: 300, invoice: invoice3, item: item3)
      invoice_item4 = create(:invoice_item, quantity: 20, unit_price: 400, invoice: invoice4, item: item4)
      transaction1 = create(:transaction, invoice: invoice1, result: 'success')
      transaction2 = create(:transaction, invoice: invoice2, result: 'success')
      transaction3 = create(:transaction, invoice: invoice3, result: 'success')
      transaction4 = create(:transaction, invoice: invoice4, result: 'success')

      expect(Merchant.most_revenue(2)).to eq([merchant4, merchant3])
      expect(Merchant.most_revenue(1)).to eq([merchant4])
  end
end
  
  describe 'business intel' do
    it ".most_items" do
      merchant1 = create(:merchant, name: 'Angie')
      merchant2 = create(:merchant, name: 'Glen')
      merchant3 = create(:merchant, name: 'Mark')
      merchant4 = create(:merchant, name: 'Booth')
      invoice1 = create(:invoice, merchant: merchant1)
      invoice2 = create(:invoice, merchant: merchant2)
      invoice3 = create(:invoice, merchant: merchant3)
      invoice4 = create(:invoice, merchant: merchant4)
      item1 = create(:item, merchant: merchant1)
      item2 = create(:item, merchant: merchant2)
      item3 = create(:item, merchant: merchant3)
      item4 = create(:item, merchant: merchant4)
      invoice_item1 = create(:invoice_item, quantity: 1, unit_price: 100, invoice: invoice1, item: item1)
      invoice_item2 = create(:invoice_item, quantity: 5, unit_price: 200, invoice: invoice2, item: item2)
      invoice_item3 = create(:invoice_item, quantity: 10, unit_price: 300, invoice: invoice3, item: item3)
      invoice_item4 = create(:invoice_item, quantity: 20, unit_price: 400, invoice: invoice4, item: item4)
      transaction1 = create(:transaction, invoice: invoice1, result: 'success')
      transaction2 = create(:transaction, invoice: invoice2, result: 'success')
      transaction3 = create(:transaction, invoice: invoice3, result: 'success')
      transaction4 = create(:transaction, invoice: invoice4, result: 'success')

      expect(Merchant.most_items(2)).to eq([merchant4, merchant3])
      expect(Merchant.most_items(1)).to eq([merchant4])
    end
    it ".revenue_by_date" do
      custy = create(:customer)
      custy_2 = create(:customer)
      merch_1 = create(:merchant)
      merch_2 = create(:merchant)
      merch_3 = create(:merchant)
      item_1 = create(:item, merchant_id: merch_1.id)
      item_2 = create(:item, merchant_id: merch_2.id)
      item_3 = create(:item, merchant_id: merch_3.id)
      invoice_1 = create(:invoice, merchant_id: merch_1.id, customer_id: custy.id, created_at: '2018-04-20')
      invoice_2 = create(:invoice, merchant_id: merch_2.id, customer_id: custy_2.id, created_at: '2018-04-20')
      invoice_3 = create(:invoice, merchant_id: merch_3.id, customer_id: custy_2.id, created_at: '2018-04-20')
      invoice_4 = create(:invoice, merchant_id: merch_1.id, customer_id: custy_2.id, created_at: '2018-04-21')
      ii_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice_1.id, quantity: 10, unit_price: 1000000 )
      ii_2 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice_2.id, quantity: 20, unit_price: 2000000 )
      ii_3 = create(:invoice_item, item_id: item_3.id, invoice_id: invoice_3.id, quantity: 10, unit_price: 3000000 )
      ii_4 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice_4.id, quantity: 10, unit_price: 4000000 )
      tran_1 = create(:transaction, invoice_id: invoice_1.id, result: "success")
      tran_2 = create(:transaction, invoice_id: invoice_2.id, result: "success")
      tran_3 = create(:transaction, invoice_id: invoice_3.id, result: "success")
      tran_4 = create(:transaction, invoice_id: invoice_4.id, result: "success")

      expect(Merchant.revenue_by_date('2018-04-20')).to eq(80000000)
    end
  end
end

