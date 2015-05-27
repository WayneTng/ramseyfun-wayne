require 'rails_helper'

RSpec.describe DishesController, type: :controller do

  describe '#index' do
    let!(:dishes) { create_list(:dish, 2) }

    it 'it get a list of dishes from dish controller' do
      get :index
      expect(assigns(:dishes).size).to eq dishes.size
    end
  end 

  describe '#index#search' do
    let!(:non_curry_dish) { create(:dish) }
    let!(:curry_dish)     { create(:dish, title: "Curry chicken" , description: "Curry") }

    it 'Search result match with database' do
      get :index, search: { keyword: 'curry' }
      expect(assigns(:dishes).first.description).to eq 'Curry'
    end
  end

  describe '#show' do
    let!(:dish) { create(:dish) }

    it 'it get a dish id to display' do
      get :show, id: dish
      expect(assigns(:dish).id).to eq dish.id
    end
  end

  context 'Fan logged in' do
    let!(:fan) { create(:fan) }
    before { sign_in fan }

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
