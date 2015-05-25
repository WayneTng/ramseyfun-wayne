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

  describe '#index#search' do
    let!(:dishes){ create(:dish) }
    it 'Search result match with database' do
      get :index, product: attributes_for(:dish)
      #expect{ assigns(dishes: :description.upcase) }.should include {dishes :description.upcase}
      #assigns{ dishes: :description }.should include ("CHICKEN")
      assigns(:dishes).each do |f|
        f.description.upcase.should include "CHICKEN"
      end
    end
  end
end
