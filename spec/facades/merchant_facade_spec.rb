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

  it ".get_merchant_items" do
    VCR.use_cassette('get_merchant_1_items') do
      items = MerchantFacade.new.get_merchant_items(1)
      expect(items).to be_instance_of(Array)
      expect(items.first).to be_instance_of(Item)
      expect(items.length).to eq(15)
      #should I test that all merchant id's are 1?
    end
  end
end
