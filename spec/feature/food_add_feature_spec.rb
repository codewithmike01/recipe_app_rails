require 'spec_helper'
require 'rails_helper'

RSpec.describe 'Food page:', type: :feature do
  subject do
    user = User.create!(name: 'Rose', email: 'Rose@gmail.com', confirmed_at: Time.now, password: 'password')
  end

  before(:each) do
    subject.save
    visit new_user_session_path

    Food.create!(name: 'Plaintain', measurement_unit: 'units', price: 20, user_id: subject.id)

    fill_in 'email', with: subject.email
    fill_in 'Password', with: subject.password
    click_button 'Log in'

    click_on 'Foods'

    click_on 'Add food'
  end

  it ' Click Add Food expect add food page' do
    expect(page).to have_current_path(new_user_food_path(subject.id))
  end

  it 'Add food' do
    fill_in 'name', with: 'Chicken breast'
    fill_in 'price', with: 45
    select 'Units', from: 'measurement_unit'

    click_button 'Create Food'

    expect(page).to have_content('Successfully added food')
    expect(page).to have_content('Chicken breast')
  end
end
