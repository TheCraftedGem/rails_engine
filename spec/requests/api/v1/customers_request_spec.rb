require 'rails_helper'

RSpec.describe "Customers API" do
  it "sends list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'
    expect(response).to be_successful
    customers = JSON.parse(response.body)
    expect(customers["data"].count).to eq(3)
  end
  it "sends one customer by id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    result = JSON.parse(response.body)
    expect(response).to be_successful
    expect(result["data"]["id"].to_i).to eq(id)
  end
end