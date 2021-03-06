require 'rails_helper'

describe "Invoice Items API" do
    it "sends a list of invoicess" do
      create_list(:invoice_item, 3)

      get '/api/v1/invoice_items'

      expect(response).to be_successful
      invoice_items = JSON.parse(response.body)
      expect(invoice_items["data"].count).to eq(3)
    end
    it "sends one invoice_item by id" do
      id = create(:invoice_item).id
  
      get "/api/v1/invoice_items/#{id}"
  
      result = JSON.parse(response.body)
      expect(response).to be_successful
      expect(result["data"]["id"].to_i).to eq(id)
    end
  end