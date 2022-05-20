require 'rails_helper'

RSpec.describe 'Recipe model Test', type: :model do
  subject do
    User.create!(name: 'Mithi', email: 'mithi@gmail.com', confirmed_at: Time.now, password: 'password')
  end

  before(:each) { subject.save }

  it 'Name not nil' do
    recipe = Recipe.create!(name: 'chicken', description: 'anything', preparation_time: 1, cooking_time: 1,
                            user_id: subject.id)
    recipe.name = nil

    expect(recipe).to be_invalid
  end
  it 'Description is not nill' do
    recipe = Recipe.create!(name: 'kabab', description: 'anything', preparation_time: 1, cooking_time: 1,
                            user_id: subject.id)
    recipe.description = nil

    expect(recipe).to be_invalid
  end
  it 'preparation_time is not nill' do
    recipe = Recipe.create!(name: 'kabab', description: 'anything', preparation_time: 1, cooking_time: 1,
                            user_id: subject.id)
    recipe.preparation_time = nil

    expect(recipe).to be_invalid
  end
end
