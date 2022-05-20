require 'rails_helper'

RSpec.describe 'Food', type: :request do
  context 'Food/index' do
    before(:example) do
      user = User.create!(name: 'Hope', email: 'hoe@gmail.com', confirmed_at: Time.now, password: 'password',
                          password_confirmation: 'password')
      Food.create!(name: 'Dodokido', measurement_unit: 'grams', price: 90, user_id: user.id)
      Food.create!(name: 'Plaintain', measurement_unit: 'units', price: 20, user_id: user.id)

      get user_foods_path(user.id)
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'render template' do
      expect(response).to render_template('foods/index')
    end

    it 'Response body' do
      expect(response.body).to include('Food')
    end
  end
end
