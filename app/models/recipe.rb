class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :recipe_food, dependent: :destroy

  def self.recipe_update_public(recipe_id)
    recipe = Recipe.find(recipe_id)
    recipe.update(public: !recipe.public)
  end
end
