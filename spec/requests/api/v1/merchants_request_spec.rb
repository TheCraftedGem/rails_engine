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
  it "can find a merchant by id" do
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

 it "can find all merchants by updated_at  with finder" do
    merch = create(:merchant, updated_at: '2012-03-27 14:53:58 UTC')
  
    get "/api/v1/merchants/random"
    
    merchant = JSON.parse(response.body)
    
    expect(response).to be_successful
    expect(merchant["data"]["attributes"]["name"]).to eq("Mona Lisa")
  end
  it "returns items associated with a merchant" do
    merch1 = create(:merchant, name: "Randal")
    create_list(:item, 10, merchant_id: merch1.id)
    create_list(:item, 10)

    get "/api/v1/merchants/:id/items?id=#{merch1.id}"

    result = JSON.parse(response.body)
    expect(response).to be_successful
    expect(result["data"].count).to eq(10)
    expect(result["data"].first["attributes"]["merchant_id"]).to eq(merch1.id)
  end
  it "returns invoices associated with a merchant" do
    merch1 = create(:merchant, name: "Homes")
    create_list(:invoice, 10, merchant_id: merch1.id)
    create_list(:invoice, 10)

    get "/api/v1/merchants/:id/invoices?id=#{merch1.id}"

    result = JSON.parse(response.body)
    expect(response).to be_successful
    expect(result["data"].count).to eq(10)
    expect(result["data"].first["attributes"]["merchant_id"]).to eq(merch1.id)
  end
end