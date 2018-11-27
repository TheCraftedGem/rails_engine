require 'rails_helper'

RSpec.describe "Customers API" do
  it "sends list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'
    expect(response).to be_successful
    customers = JSON.parse(response.body)
    expect(customers.count).to eq(3)
  end
end