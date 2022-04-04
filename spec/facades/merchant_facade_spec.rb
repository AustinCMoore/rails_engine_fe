require "rails_helper"

RSpec.describe 'The Merchant Facade' do
  it ".get_all_merchants" do
    VCR.use_cassette('get_all_merchants') do
      all_merchants = MerchantFacade.new.get_all_merchants
      expect(all_merchants).to be_instance_of(Array)
      expect(all_merchants.first).to be_instance_of(Merchant)
      expect(all_merchants.length).to eq(100)
    end
  end

  it ".get_merchant" do
    VCR.use_cassette('get_merchant_1') do
      merchant = MerchantFacade.new.get_merchant(1)
      expect(merchant).to be_instance_of(Merchant)
      #should I test attributes?
    end
  end
end
