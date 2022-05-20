require 'spec_helper'
require 'rails_helper'

RSpec.describe 'Login user:', type: :feature do
  before(:each) do
    visit new_user_session_path
  end

  it 'Show error when submit with Empty fields' do
    fill_in 'email', with: ' '
    fill_in 'Password', with: ' '
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password.')
  end

  it 'Show error when submit with wrong fields values' do
    fill_in 'email', with: 'wrong'
    fill_in 'Password', with: 'wrong'
    click_button 'Log in'
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'Show error when submit with correct fields values' do
    user = User.create!(name: 'Jonyole', email: 'e@gmail.com', confirmed_at: Time.now, password: 'password')

    fill_in 'email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_current_path('/')
    expect(page).to have_content('Signed in successfully.')
  end

  it 'Can see user name for all user' do
    user = User.create!(name: 'Rose', email: 'hope@gmail.com', confirmed_at: Time.now, password: 'password')

    fill_in 'email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    user1 = User.create!(name: 'Boy', email: 'jle@gmail.com', confirmed_at: Time.now, password: 'password')
    user2 = User.create!(name: 'Girly', email: 'le@gmail.com', confirmed_at: Time.now, password: 'password')

    visit users_path

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end
end
