class DishesController < ApplicationController

  def index
    @dishes = Dish.all
   # @dishes = @dishes.published
   # @dishes = @dishes.search_title_and_description(params[:description], params[:description])
  end

  def show
    @dish = Dish.find(dish_id)
  end

  private

  def dish_id
    params.require(:id)
  end
end
