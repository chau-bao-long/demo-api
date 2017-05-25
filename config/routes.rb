Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '/api' do
    resource :user, only: [:create, :show, :update] do
      collection do
        get :confirm_email
      end
    end

    post 'login', to: 'sessions#login'
    delete 'logout', to: 'sessions#logout'
    patch 'refresh_token', to: 'sessions#refresh_token'
  end
end
