class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def self.total_value_of_food(user_id)
    sum = 0
    foods = Food.where(user_id: user_id)
    foods.each do |food|
      recipe = RecipeFood.recipe_quantity(food.id)
      sum += (recipe.quantity * food.price) if RecipeFood.quantity?(food.id)
    end
    sum
  end

  def self.recipe_quantity(food_id)
    recipe = RecipeFood.where(food_id: food_id)
    recipe[0]
  end

  def self.quantity?(food_id)
    RecipeFood.find_by(food_id: food_id)
  end
end
