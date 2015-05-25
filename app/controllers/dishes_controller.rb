class DishesController < ApplicationController

  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(dish_id)
  end

  def dish_id
    params.require(:id)
  end
end
