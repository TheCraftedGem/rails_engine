require 'rails_helper'

describe "Invoices API" do
  it "sends a list of invoicess" do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_successful
    invoices = JSON.parse(response.body)
    expect(invoices["data"].count).to eq(3)
  end
  it "sends one invoice by id" do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    result = JSON.parse(response.body)
    expect(response).to be_successful
    expect(result["data"]["id"].to_i).to eq(id)
  end
end