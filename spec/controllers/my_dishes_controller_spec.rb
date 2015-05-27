require 'rails_helper'

RSpec.describe MyDishesController, type: :controller do

  context 'Fan Logged in' do
    let!(:fan) { create(:fan) }
    before { sign_in fan }

    describe '#index' do
      let!(:my_dishes) { create_list(:dish, 4) }

      it 'get a list of dishes that belongs to the users' do
        my_dishes.each do |dish|
          dish.update(fan: fan)
        end
        my_dishes
        get :index
        expect(assigns(:my_dishes).size).to eq my_dishes.size 
      end
    end
  end
end
