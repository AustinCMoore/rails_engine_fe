require 'rails_helper'

RSpec.describe 'The merchants show' do
  it "has the merchant as a title" do
    VCR.use_cassette('get_merchant_1_title') do
      visit "/merchants/1"

      within '#title' do
        expect(current_path).to eq("/merchants/1")
        expect(page).to have_content('Schroeder-Jerde')
      end
    end
  end

  it "has the merchant's items'" do
    VCR.use_cassette('get_merchant_1_items_render') do
      visit "/merchants/1"

      within '#items' do
        expect(page).to have_content('Items')
        expect(page).to have_link('Item Nemo Facere')
      end
    end
  end
end
