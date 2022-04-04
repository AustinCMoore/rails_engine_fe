#As a visitor
#When I visit /merchants
#I should see a list of merchants by name (alphabetical?)
#When I click on the merchant's name,
#I should be on that merchant's show page
#I should see a list of items that merchant sells

require 'rails_helper'

RSpec.describe 'The merchants index' do
  it "has a list of merchants by name" do
    VCR.use_cassette('get_all_merchants') do
      visit "/merchants"

      within '#merchants' do
        expect(page).to have_content('Merchants')
        # expect(page).to have_link('') (Merchant names)
        # Should length be tested?
        # Any way to validate the merchants created?
      end
    end
  end

  it "links to the show page when a merchant name is clicked" do
    VCR.use_cassette('get_all_merchants') do
      visit "/merchants"
      within '#merchants' do
        # click_link 'Merchant Name'
      end
      # expect(current_path).to eq("/merchants/#{merchant.id}")
    end
  end
end
