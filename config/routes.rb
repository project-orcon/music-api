  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  Rails.application.routes.draw do

    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'

    scope module: :v1, constraints: ApiVersion.new('v1', true) do
      resources :songs do
        resources :notes
      end
    end
    
  end
  

