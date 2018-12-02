require 'rails_helper'

describe "Transactions API" do
  it "sends a list of transactions" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_successful
    transactions = JSON.parse(response.body)
    expect(transactions["data"].count).to eq(3)
  end

  it "sends one transaction by id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    result = JSON.parse(response.body)
    expect(response).to be_successful
    expect(result["data"]["id"].to_i).to eq(id)
  end
end