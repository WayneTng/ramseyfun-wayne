require 'rails_helper'

RSpec.describe 'Public can search for dishes', type: :feature do

  describe 'search for dishes' do
    let!(:chicken_rice_dish) { create(:dish, title: 'chicken') }
    let!(:soup_base_dish) { create(:dish, title: 'fish soup') }

    it 'can search dishes' do
      visit '/'
      fill_in 'search_keyword', with: 'soup'
      click_on 'Submit Search'

      expect(page).not_to have_content 'chicken'
      expect(page).to have_content 'soup'
    end
  end
end
