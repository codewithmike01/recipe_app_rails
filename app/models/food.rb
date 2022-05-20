class Food < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :recipe_food, dependent: :destroy

  #  Shows the count of food for a user
  def self.total_food(user_id)
    Food.where(user_id: user_id).count
  end

  # Food value total count
  def self.food_money(user_id)
    Food.where(user_id: user_id).sum(:price)
  end
end
