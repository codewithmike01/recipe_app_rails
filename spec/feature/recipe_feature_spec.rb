require 'spec_helper'
require 'rails_helper'

RSpec.describe 'Recipe page:', type: :feature do
  before(:each) do
    visit new_user_session_path

    user = User.create!(name: 'santa', email: 'santa@gmail.com', confirmed_at: Time.now, password: 'password')

    Recipe.create!(name: 'Rice', description: 'anything', preparation_time: 1, cooking_time: 1, user_id: user.id)

    fill_in 'email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  it 'Recipe be present' do
    click_on 'Recipe'

    expect(page).to have_content('Rice')
    expect(page).to have_content('anything')
  end

  it 'Remove Recipe' do
    click_on 'Recipe'

    click_button 'Remove'

    expect(page).to have_content('Recipe removed')
  end
end
