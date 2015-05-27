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
end
