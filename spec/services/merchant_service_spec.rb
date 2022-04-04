require "rails_helper"

RSpec.describe 'The Merchant Service' do
  it ".index" do
    VCR.use_cassette('get_all_merchants') do
      all_merchants = MerchantService.index
      # How to test a successful response?
      expect(all_merchants).to be_instance_of(Hash)
      expect(all_merchants[:data]).to be_instance_of(Array)
      expect(all_merchants[:data].first).to be_instance_of(Hash)
      expect(all_merchants[:data].first[:id]).to be_instance_of(String)
      expect(all_merchants[:data].first[:type]).to eq("merchant")
      expect(all_merchants[:data].first[:attributes]).to be_instance_of(Hash)
      expect(all_merchants[:data].first[:attributes].length).to eq(1)
      expect(all_merchants[:data].first[:attributes]).to have_key(:name)
      expect(all_merchants[:data].first[:attributes][:name]).to be_instance_of(String)
    end
  end

  it ".show" do
    VCR.use_cassette('get_merchant_1') do
      merchant = MerchantService.show(1)[:data]
      expect(merchant).to be_instance_of(Hash)
      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to eq("1")
      expect(merchant).to have_key(:type)
      expect(merchant[:type]).to eq("merchant")
      expect(merchant).to have_key(:attributes)
      expect(merchant[:attributes].length).to eq(1)
      expect(merchant[:attributes][:name]).to eq("Schroeder-Jerde")
    end
  end

  it ".merchant_items" do
    VCR.use_cassette('get_merchant_1_items') do
      items = MerchantService.merchant_items(1)

      expect(items).to be_instance_of(Hash)
      expect(items[:data]).to be_instance_of(Array)
      expect(items[:data].first).to be_instance_of(Hash)
      expect(items[:data].first[:id]).to be_instance_of(String)
      expect(items[:data].first[:type]).to eq("item")
      expect(items[:data].first[:attributes]).to be_instance_of(Hash)
      expect(items[:data].first[:attributes].length).to eq(4)
      expect(items[:data].first[:attributes]).to have_key(:name)
      expect(items[:data].first[:attributes][:name]).to be_instance_of(String)
      expect(items[:data].first[:attributes]).to have_key(:description)
      expect(items[:data].first[:attributes][:description]).to be_instance_of(String)
      expect(items[:data].first[:attributes]).to have_key(:unit_price)
      expect(items[:data].first[:attributes][:unit_price]).to be_instance_of(Float)
      expect(items[:data].first[:attributes]).to have_key(:merchant_id)
      expect(items[:data].first[:attributes][:merchant_id]).to be_instance_of(Integer)
    end
  end
end
