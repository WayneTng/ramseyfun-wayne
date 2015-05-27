class MyDishesController < ApplicationController
  before_action :authenticate_fan!

  def index
    @my_dishes = Dish.where(fan_id: fan_id)
  end

  def new
    @my_dish = Dish.new
  end

  def create
    fan_id = current_fan.id
    @my_dish = Dish.new(dish_params.merge(fan_id: fan_id))
    @my_dish.published = true
    if @my_dish.save
      flash[:notice] = "You have successfully created your dish!"
      redirect_to dishes_url
    else
      flash[:alert] = "There is an error during creation, please try again."
      render :new
    end
  end
  
  def edit
    @my_dish = Dish.find(dish_id)
    render :new
  end

  def update
    @my_dish = Dish.find(dish_id)
    if @my_dish.update(dish_params)
      flash[:notice] = "You have Successfully Update your dish"
      redirect_to my_dishes_url
    else
      flash.now[:alert] = "There's an error on updating, please try again."
      render :new
    end
  end

  private

  def fan_id
    current_fan.id
  end

  def dish_id
    params.require(:id)
  end

  def dish_params
    params.require(:dish).permit(:title,
                                 :description,
                                 :cost,
                                 :pax,
                                 :vegetarian,
                                 :fan_id)
  end
end
