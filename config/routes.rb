Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '/api' do
    resources :users, only: [:show, :create, :update]
    post 'login', to: 'sessions#login'
    patch 'refresh-token', to: 'sessions#refresh_token'
  end
end
