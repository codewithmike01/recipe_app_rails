require 'spec_helper'
require 'rails_helper'

RSpec.describe 'Food page:', type: :feature do
  before(:each) do
    visit new_user_session_path

    user = User.create!(name: 'Jonyfood', email: 'foodjay@gmail.com', confirmed_at: Time.now, password: 'password')

    Food.create!(name: 'Plaintain', measurement_unit: 'units', price: 20, user_id: user.id)

    fill_in 'email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  it 'Food be present' do
    click_on 'Foods'

    expect(page).to have_content('Plaintain')
    expect(page).to have_content('$20')
  end

  it ' Delete Food' do
    click_on 'Foods'

    click_button 'Delete'

    expect(page).to have_content('Successfully deleted food')
  end
end
