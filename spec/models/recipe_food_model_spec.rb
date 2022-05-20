require 'rails_helper'

RSpec.describe 'Food model Test', type: :model do
  subject do
    User.create!(name: 'Frk', email: 'frank@gmail.com', confirmed_at: Time.now, password: 'password')
  end

  before(:each) { subject.save }

  it 'return sum total of food quanty * price' do
    food1 = Food.create!(name: 'Egg', measurement_unit: 'grams', price: 90, user_id: subject.id)
    food2 = Food.create!(name: 'Fish', measurement_unit: 'grams', price: 2, user_id: subject.id)
    recipe = Recipe.create!(name: 'Rice', description: 'anything', preparation_time: 1, cooking_time: 1,
                            user_id: subject.id)
    RecipeFood.create!(food_id: food1.id, recipe_id: recipe.id, quantity: 10)
    RecipeFood.create!(food_id: food2.id, recipe_id: recipe.id, quantity: 2)
    total = RecipeFood.total_value_of_food(subject.id)

    expect(total).to eq(904)
  end

  it 'Check if food have quantity or not' do
    food = Food.create!(name: 'Eggo', measurement_unit: 'grams', price: 90, user_id: subject.id)
    recipe = Recipe.create!(name: 'Rice', description: 'anything', preparation_time: 1, cooking_time: 1,
                            user_id: subject.id)

    RecipeFood.create!(food_id: food.id, recipe_id: recipe.id, quantity: 10)

    value = RecipeFood.quantity?(food.id)

    expect(value).to be_truthy
  end

  it 'to return quantity of a food' do
    food = Food.create!(name: 'Eggo', measurement_unit: 'grams', price: 90, user_id: subject.id)
    recipe = Recipe.create!(name: 'Rice', description: 'anything', preparation_time: 1, cooking_time: 1,
                            user_id: subject.id)

    RecipeFood.create!(food_id: food.id, recipe_id: recipe.id, quantity: 50)
    value = RecipeFood.recipe_quantity(food.id)

    expect(value.quantity).to eq(50)
  end

  it 'recipe update public' do
    recipe = Recipe.create!(name: 'Rice', description: 'anything', preparation_time: 1, cooking_time: 1,
                            user_id: subject.id, public: false)

    Recipe.recipe_update_public(recipe.id)

    expect(recipe.public).to be_falsey
  end
end
