require 'rails_helper'

RSpec.describe 'Recipe', type: :request do
  context 'Recipe/index' do
    before(:example) do
      user = User.create!(name: 'Mithi', email: 'any@gmail.com', confirmed_at: Time.now, password: 'password',
                          password_confirmation: 'password')
      Recipe.create!(name: 'chicken', description: 'anything', preparation_time: 1, cooking_time: 1, user_id: user.id)
      Recipe.create!(name: 'Rice', description: 'anything', preparation_time: 1, cooking_time: 1, user_id: user.id)

      get user_recipes_path(user.id)
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'render template' do
      expect(response).to render_template('recipes/index')
    end

    it 'Response body' do
      expect(response.body).to include('Recipe')
    end
  end
end
