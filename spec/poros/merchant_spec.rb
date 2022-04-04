require "rails_helper"

RSpec.describe Merchant do
  it "exists with attributes" do
    data = {
      :id => "1",
      :type => "merchant",
      :attributes => {
        :name => "merchant 1"
      }
    }

    merchant = Merchant.new(data)

    expect(merchant).to be_instance_of(Merchant)
    expect(merchant.id).to eq("1")
    expect(merchant.name).to eq("merchant 1")
  end
end
