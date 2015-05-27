class MyDishesController < ApplicationController
  before_action :authenticate_fan!

  def index
    @my_dishes = Dish.where(fan_id: fan_id)
  end

  private

  def fan_id
    current_fan.id
  end
end
