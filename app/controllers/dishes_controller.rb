class DishesController < ApplicationController

  def index
    @dishes = Dish.all
    @dishes = @dishes.published
    if params[:search]
      @keyword = params[:search][:keyword]     
      @dishes = @dishes.search_title_and_description(@keyword)
    end
  end

  def show
    @dish = Dish.find(dish_id)
  end

  private

  def dish_id
    params.require(:id)
  end
end
