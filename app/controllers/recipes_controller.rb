class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(name: recipe_params[:name],
                         preparation_time: recipe_params[:preparation_time],
                         cooking_time: recipe_params[:cooking_time],
                         description: recipe_params[:description],
                         public: recipe_params[:public],
                         user_id: current_user.id)
    respond_to do |format|
      format.html do
        if @recipe.save
          flash[:notice] = 'Recipe created successfully.'
          redirect_to "/users/#{@recipe.user.id}/recipes/"
        else
          flash[:notice] = 'Recipe creation failed. Try again'
          render :new
        end
      end
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
  end

  def destroy
    @recipe = Recipe.find(params[:id]).destroy
    redirect_to user_recipes_path(current_user.id), notice: 'Recipe removed'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
