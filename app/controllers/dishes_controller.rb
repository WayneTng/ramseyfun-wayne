class DishesController < ApplicationController
  before_action :authenticate_fan!, except: [:index, :show]

  def index
    @dishes = Dish.published
    @dishes = @dishes.order(created_at: :desc)

    @keyword = search_keyword     
    @dishes = @dishes.search_title_and_description(@keyword) if @keyword
  end

  def show
    @dish = Dish.find(dish_id)
  end

  private

  def dish_id
    params.require(:id)
  end

  def search_keyword
    params.fetch(:search, {}).permit(:keyword)[:keyword]
  end
end
