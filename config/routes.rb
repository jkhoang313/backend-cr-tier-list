Rails.application.routes.draw do
  scope '/api' do
    get '/get_user', to: 'sessions#show'
    post '/login', to: 'sessions#create'

    post '/user', to: 'users#create'
    put '/user', to: 'users#update'

    post '/reset_password', to: 'settings#create'
  end
end