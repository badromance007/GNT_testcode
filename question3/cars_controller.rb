class CarsController < ApplicationController
  def new
    @car = Car.new
  end
 
  def create
    @car = Car.new(car_params)
 
    if @car.save
      redirect_to @car
    else
      render 'new'
    end
  end

  private

  def car_params
    params.require(:car).permit(:maker, :model, :year, :color, :price)
  end
end