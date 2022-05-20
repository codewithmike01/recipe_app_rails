Rails.application.routes.draw do



  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'register' }

  resources :users, only: %i[ index show] do
    resources :shops, only: %i[index]
    resources :foods, except: %i[update]
    resources :recipes, except: %i[update] do
      resources :recipe_foods, only: %i[new create]
    end
    resources :public, only: %i[index]
  end

  root 'users#index'
end