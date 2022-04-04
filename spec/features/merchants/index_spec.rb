require 'rails_helper'

RSpec.describe 'The merchants index' do
  it "has a list of merchants by name" do
    VCR.use_cassette('get_all_merchants') do
      visit "/merchants"

      within '#merchants' do
        expect(page).to have_content('Merchants')
        expect(page).to have_link('Schroeder-Jerde') #what if this is deleted?
        expect(page).to have_link('Glover Inc')
      end
    end
  end

  it "links to the show page when a merchant name is clicked" do
    VCR.use_cassette('get_all_merchants') do
      visit "/merchants"
      within '#merchants' do
        click_link 'Schroeder-Jerde' #what if this is deleted?
      end
      expect(current_path).to eq("/merchants/1") #what if there are more?
    end
  end
end
