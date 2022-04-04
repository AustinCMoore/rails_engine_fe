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
end
