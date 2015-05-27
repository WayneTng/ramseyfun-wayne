class DishesController < ApplicationController
  before_action :authenticate_fan!, except: [:index, :show]

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

  def new
    @dish = Dish.new
  end
def create
    fan_id = current_fan.id
    @dish = Dish.new(dish_params.merge(fan_id: fan_id))
    @dish.published = true
    if @dish.save
      flash[:notice] = "You have successfully created your dish!"
      redirect_to dishes_url
    else
      flash[:alert] = "There is an error during creation, please try again."
      render :new
    end
  end

  private

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
