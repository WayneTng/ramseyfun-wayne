require 'rails_helper'

RSpec.describe 'Public can search for dishes', type: :feature do

  describe 'search for dishes' do
    let!(:fan)               { create(:fan) }
    let!(:soup_base_dish)    { create(:dish, title: 'fish soup') }
    let!(:chicken_rice_dish) { build(:dish, title: 'chicken') }

    it 'can search dishes' do
      visit '/'
      expect(page).not_to have_content 'chicken'

      click_on 'Log in'
      fill_in 'fan_email',        with: fan.email
      fill_in 'fan_password',     with: fan.password
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'

      click_on 'Create Dish'
      fill_in 'dish_title',       with: chicken_rice_dish.title
      fill_in 'dish_description', with: chicken_rice_dish.description
      fill_in 'dish_cost',        with: chicken_rice_dish.cost
      fill_in 'dish_pax',         with: chicken_rice_dish.pax
      check 'dish_vegetarian'
      click_button 'Create Dish'
      expect(page).to have_content 'chicken'

      fill_in 'search_keyword',   with: 'soup'
      click_on 'Submit Search'

      expect(page).not_to have_content 'chicken'
      expect(page).to have_content 'soup'
    end
  end
end
