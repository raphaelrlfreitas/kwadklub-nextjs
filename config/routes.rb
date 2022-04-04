Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  scope '/api' do
    
    devise_for :users,
    path_names: { 
      sign_in: 'login', 
      sign_out: 'logout'
    }, 
    controllers: {
      registrations: :registrations,
      sessions: :sessions
    }

    resources :profiles, only: [:index, :show, :update, :create]
    resources :users, only: [:show]

    get '/validate_token', to: 'users#validate_token'

  end
end
