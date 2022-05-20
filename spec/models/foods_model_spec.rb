require 'rails_helper'

RSpec.describe 'Food model Test', type: :model do
  subject do
    User.create!(name: 'Frank', email: 'frank@gmail.com', confirmed_at: Time.now, password: 'password')
  end

  before(:each) { subject.save }

  it 'Name not nil' do
    food = Food.create!(name: 'Dodokido', measurement_unit: 'grams', price: 90, user_id: subject.id)
    food.name = nil

    expect(food).to be_invalid
  end

  it 'Price not less than zero' do
    food = Food.create!(name: 'Dodokido', measurement_unit: 'grams', price: 90, user_id: subject.id)
    food.price = -1

    expect(food).to be_invalid
  end

  it ' Show number of food user have' do
    Food.create!(name: 'Dodokido', measurement_unit: 'grams', price: 90, user_id: subject.id)
    Food.create!(name: 'Plaintain', measurement_unit: 'units', price: 20, user_id: subject.id)

    total_value = Food.total_food(subject.id)
    expect(total_value).to eq(2)
  end

  it 'Show sum total of food price for user' do
    Food.create!(name: 'Dodokido', measurement_unit: 'grams', price: 90, user_id: subject.id)
    Food.create!(name: 'Plaintain', measurement_unit: 'units', price: 20, user_id: subject.id)

    money_sum = Food.food_money(subject.id)
    expect(money_sum).to eq(110)
  end
end
