Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#welcome'

  get '/choirs', to: 'choirs#index'
  get '/choirs/:id', to: 'choirs#show'
  get '/choir_members', to: 'choir_members#index'
  get '/choir_members/:id', to: 'choir_members#show'
  get '/choirs/:choir_id/choir_members', to: 'choirs_choir_members#index'

#climbing gyms
  get '/climbing_gyms', to: 'climbing_gyms#index'
  get '/climbing_gyms/new', to: 'climbing_gyms#new'
  post '/climbing_gyms', to: 'climbing_gyms#create'
  get '/climbing_gyms/:gym_id', to: 'climbing_gyms#show'
  get '/climbing_gyms/:gym_id/edit', to: 'climbing_gyms#edit'
  patch '/climbing_gyms/:gym_id', to: 'climbing_gyms#update'
  delete '/climbing_gyms/:gym_id', to: 'climbing_gyms#destroy'

#gym members
  get '/gym_members', to: 'gym_members#index'
  get '/gym_members/:member_id', to: 'gym_members#show'
  get '/gym_members/:member_id/edit', to: 'gym_members#edit'
  patch '/gym_members/:member_id', to: 'gym_members#update'
  delete '/gym_members/:member_id', to: 'gym_members#destroy'

#climbing gym gym members
  get '/climbing_gyms/:gym_id/gym_members', to: 'climbing_gym_gym_members#index'
  get '/climbing_gyms/:gym_id/gym_members/new', to: 'climbing_gym_gym_members#new'
  post '/climbing_gyms/:gym_id/gym_members', to: 'climbing_gym_gym_members#create'
end
