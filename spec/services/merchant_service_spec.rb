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
end
