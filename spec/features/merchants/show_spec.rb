#I should see a list of items that merchant sells

require 'rails_helper'

RSpec.describe 'The merchants show' do
  it "has a list of that merchant's items" do
    VCR.use_cassette('get_merchant_1') do
      visit "/merchants/1"

      within '#title' do
        expect(page).to have_content('Schroeder-Jerde')
      end

      within '#items' do
        # expect(page).to have_link('')
      end
    end
  end
end
