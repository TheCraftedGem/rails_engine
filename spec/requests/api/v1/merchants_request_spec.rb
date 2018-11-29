require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful
    merchants = JSON.parse(response.body)

    expect(merchants["data"].count).to eq(3)
  end
  it "can get one merchant by its id" do
    id = create(:merchant).id.to_s

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)


    expect(response).to be_successful
    expect(merchant["data"]["id"]).to eq(id)
  end
  it "can create a new merchant" do
    merchant_params = { name: "Mona Lisa"}
  
    post "/api/v1/merchants", params: {merchant: merchant_params}
    merchant = Merchant.last
  
    assert_response :success
    expect(response).to be_successful
    expect(merchant.name).to eq(merchant_params[:name])
  end

  it "can update an existing merchant" do
    id = create(:merchant).id
    previous_name = Merchant.last.name
    merchant_params = { name: "Sledge" }
  
    put "/api/v1/merchants/#{id}", params: {merchant: merchant_params}
    merchant = Merchant.find_by(id: id)
  
    expect(response).to be_successful
    expect(merchant.name).to_not eq(previous_name)
    expect(merchant.name).to eq("Sledge")
  end
  it "can find a merchant name" do
    id = create(:merchant).id.to_s

    get "/api/v1/merchants/find?id = #{id}"

    merchant = JSON.parse(response.body)


    expect(response).to be_successful
    expect(merchant["data"]["id"]).to eq(id)
  end
  it "can find a merchant name" do
    name = create(:merchant).name
    get "/api/v1/merchants/find?name=#{name}"

    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant["data"]["attributes"]["name"]).to eq("Mona Lisa")
  end

  it "can find a merchant by created date" do
    first_merch = create(:merchant, created_at: '2012-03-27 14:53:58 UTC')
  
    get "/api/v1/merchants/find?created_at=#{first_merch.created_at}"

    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant["data"]["attributes"]["name"]).to eq(first_merch.name)
  end

  it "can find a merchant by updated" do
    first_merch = create(:merchant, updated_at: '2012-03-27 14:53:58 UTC')
    get "/api/v1/merchants/find?updated_at=#{first_merch.updated_at}"

    merchant = JSON.parse(response.body)
  
    expect(response).to be_successful
    expect(merchant["data"]["attributes"]["name"]).to eq(first_merch.name)
  end

  it "can find all merchants by name  with finder" do
    first_merch = create(:merchant)
  
    get "/api/v1/merchants/find_all?name=#{first_merch.name}"

    merchant = JSON.parse(response.body)
  
    expect(response).to be_successful

    expect(merchant["data"][0]["attributes"]["name"]).to eq("Mona Lisa")
  end

  it "can find all merchants by id  with finder" do
    id = create(:merchant).id.to_s
  
    get "/api/v1/merchants/find_all?id=#{id}"

    merchant = JSON.parse(response.body)
  
    expect(response).to be_successful

    expect(merchant["data"][0]["attributes"]["name"]).to eq("Mona Lisa")
  end

  it "can find all merchants by created_at  with finder" do
    created_at = create(:merchant, created_at: '2012-03-27 14:53:58 UTC')
   
    get "/api/v1/merchants/find_all?created_at=#{created_at.created_at}"
    
    merchant = JSON.parse(response.body)
    
    expect(response).to be_successful

    expect(merchant["data"][0]["attributes"]["name"]).to eq("Mona Lisa")
  end

  it "can find all merchants by updated_at  with finder" do
    merch = create(:merchant, updated_at: '2012-03-27 14:53:58 UTC')
  
    get "/api/v1/merchants/find_all?updated_at=#{merch.updated_at}"
    
    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"][0]["attributes"]["name"]).to eq("Mona Lisa")
  end

#  xit "can find all merchants by updated_at  with finder" do
#     merch = create(:merchant, updated_at: '2012-03-27 14:53:58 UTC')
  
#     get "/api/v1/merchants/random"
    
#     merchant = JSON.parse(response.body)
    
#     expect(response).to be_successful

#     expect(merchant["data"][0]["attributes"]["name"]).to eq("Mona Lisa")
#   end
end