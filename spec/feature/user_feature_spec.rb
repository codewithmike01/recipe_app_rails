require 'spec_helper'
require 'rails_helper'

RSpec.describe 'User login page index page:', type: :feature do
  before(:each) do
    visit new_user_session_path
  end

  it 'shows Email' do
    expect(page).to have_selector('input[type = email]')
    expect(page).to have_content('Email')
  end

  it 'shows Password  ' do
    expect(page).to have_selector('input[type = password]')
    expect(page).to have_field('Password')
    expect(page).to have_content('Password')
  end

  it 'shows button submit' do
    expect(page).to have_selector('input[type=submit]')
    expect(page).to have_button('Log in')
  end
end
