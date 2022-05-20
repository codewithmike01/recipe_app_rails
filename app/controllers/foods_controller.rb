class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(
      name: allowed_params[:name],
      price: allowed_params[:price],
      measurement_unit: allowed_params[:measurement_unit],
      user_id: current_user.id
    )

    if @food.save
      redirect_to user_foods_path(current_user.id), notice: 'Successfully added food'

    else
      render 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id]).destroy

    redirect_to user_foods_path(current_user.id), notice: 'Successfully deleted food'
  end

  private

  def allowed_params
    params.require(:food).permit(:name, :price, :measurement_unit)
  end
end
