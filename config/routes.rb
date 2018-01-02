Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      resources :chores
      resources :households
      resources :sessions


      post '/auth' => 'sessions#create'
      get '/current_user' => 'sessions#show'
      post '/current_user' => 'sessions#show'
      post '/chores/:id' => 'chores#update'

      get '/userchores/:id' => 'user_chores#index'
      get '/users/:id' => 'users#show'
      post '/users/:id' => 'users#update'

    end
  end
end
