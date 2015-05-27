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


    describe '#new' do
      it 'create a empty product' do
        get :new
        expect(assigns(:dish)).to be_a Dish
      end
    end

    describe '#create' do
      def do_request 
        get :create, dish: params 
      end

      context 'Success create' do
        let!(:params) { attributes_for(:dish) }
        it 'save a dishes from create' do
          expect{ do_request }.to change(Dish, :count).by(1)
        end

        it 'will redirect to index page' do
          do_request
          expect(response).to redirect_to dishes_url
        end
      end

      context 'Failure' do
        let!(:params) { attributes_for(:dish, title: "") }

        it 'fail to save a record' do
          expect { do_request }.not_to change(Dish, :count)
        end

        it 'fail it will render to #new' do
          do_request
          expect(response).to render_template :new
        end
      end
    end
  end

  context 'Fail to login' do
    
    it 'should redirect back to login page' do
      get :new
      expect(response).to redirect_to new_fan_session_path
    end
  end
end

