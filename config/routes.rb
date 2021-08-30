Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#welcome'
  get '/choirs', to: 'choirs#index'
  get '/climbing_gyms', to: 'climbing_gyms#index'
  get '/climbing_gyms/new', to: 'climbing_gyms#new'
  post '/climbing_gyms', to: 'climbing_gyms#create'
  get '/climbing_gyms/:gym_id', to: 'climbing_gyms#show'
  get '/climbing_gyms/:gym_id/edit', to: 'climbing_gyms#edit'
  patch '/climbing_gyms/:gym_id', to: 'climbing_gyms#update'
  get '/climbing_gyms/:gym_id/gym_members', to: 'climbing_gym_gym_members#index'
  get '/gym_members', to: 'gym_members#index'
  get '/gym_members/:member_id', to: 'gym_members#show'
end
