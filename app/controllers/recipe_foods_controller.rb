class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe_food = RecipeFood.new(
      quantity: allowed_params[:quantity],
      food_id: allowed_params[:food_id],
      recipe_id: params[:recipe_id]
    )

    if @recipe_food.save
      redirect_to user_recipe_path(current_user.id, params[:recipe_id]), notice: 'Succefully added quatity of food'
    else
      redirect_to new_user_recipe_recipe_food_path(current_user.id, params[:recipe_id]),
                  alert: 'Food quatity not added'
    end
  end

  private

  def allowed_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
