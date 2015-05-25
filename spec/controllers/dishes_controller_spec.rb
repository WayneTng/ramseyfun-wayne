require 'rails_helper'

RSpec.describe DishesController, type: :controller do

  describe '#index' do
    let!(:dishes){create_list(:dish, 2)}
    
    it 'it get a list of dishes from product controller' do
      get :index
      expect(assigns(:dishes).size).to eq dishes.size
    end
  end 

  describe '#show' do
    let!(:dish){create(:dish)}

    it 'it get a product id to display' do
      get :show, id: dish
      expect(assigns(:dish).id).to eq dish.id
    end
  end
end
