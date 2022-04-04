require "rails_helper"

RSpec.describe Item do
  it "exists with attributes" do
    data = {
      :id => "1",
      :type => "item",
      :attributes => {
        :name => "item 1",
        :description => "This is item 1",
        :unit_price => 9.99,
        :merchant_id => 1
      }
    }

    item = Item.new(data)

    expect(item).to be_instance_of(Item)
    expect(item.id).to eq("1")
    expect(item.name).to eq("item 1")
    expect(item.description).to eq("This is item 1")
    expect(item.unit_price).to eq(9.99)
    expect(item.merchant_id).to eq(1)
  end
end
