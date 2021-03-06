Rails.application.routes.draw do
  scope '/api' do
    get '/get_user', to: 'sessions#show'
    post '/login', to: 'sessions#create'

    post '/user', to: 'users#create'
    put '/user', to: 'users#update'

    post '/reset_password', to: 'settings#create'

    resources :tier_lists, only: [:index]
    resources :tier_list_types, only: [:index]

    resources :cards
  end
end
