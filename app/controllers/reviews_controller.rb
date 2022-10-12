class ReviewsController < ApplicationController
  def index
    @reviews = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to reviews_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to reviews_path
  end
  
  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)

  end
end
