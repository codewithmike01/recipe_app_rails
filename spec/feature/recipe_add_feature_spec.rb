require 'spec_helper'
require 'rails_helper'

RSpec.describe 'Recipe page:', type: :feature do
  subject do
    user = User.create!(name: 'John', email: 'John@gmail.com', confirmed_at: Time.now, password: 'password')
  end

  before(:each) do
    subject.save
    visit new_user_session_path

    Recipe.create!(name: 'Samosa', description: 'anything', preparation_time: 1, cooking_time: 1, user_id: subject.id)

    fill_in 'email', with: subject.email
    fill_in 'Password', with: subject.password
    click_button 'Log in'

    click_on 'Recipe'

    click_on 'Add Recipe'
  end

  it ' Click Add Recipe expect add recipe page' do
    expect(page).to have_current_path(new_user_recipe_path(subject.id))
  end

  it 'New Recipe' do
    fill_in 'name', with: 'Chicken'
    fill_in 'cooking_time', with: 1
    fill_in 'preparation_time', with: 1
    fill_in 'description', with: 'ygughu'

    click_button 'Create Recipe'

    expect(page).to have_content('Recipe created successfully')
    expect(page).to have_content('Samosa')
  end
end
