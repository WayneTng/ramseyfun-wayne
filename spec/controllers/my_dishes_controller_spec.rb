require 'rails_helper'

RSpec.describe MyDishesController, type: :controller do

  context 'Fan Logged in' do
    let!(:fan) { create(:fan) }
    before { sign_in fan }

    describe '#index' do
      let!(:fan) { create(:fan, :with_dishes) }

      it 'get a list of dishes that belongs to the users' do
        get :index
        expect(assigns(:my_dishes).size).to eq fan.dishes.size 
      end
    end
  end
end
