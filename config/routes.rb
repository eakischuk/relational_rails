Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#welcome'
  
  get '/choirs', to: 'choirs#index'
  get '/choirs/:id', to: 'choirs#show'
  get '/choir_members', to: 'choir_members#index'
  get '/choir_members/:id', to: 'choir_members#show'
  get '/choirs/:choir_id/choir_members', to: 'choirs_choir_members#index'

  get '/climbing_gyms', to: 'climbing_gyms#index'
  get '/climbing_gyms/:gym_id', to: 'climbing_gyms#show'
  get '/gym_members', to: 'gym_members#index'
  get '/gym_members/:member_id', to: 'gym_members#show'
  get '/climbing_gyms/:gym_id/gym_members', to: 'climbing_gym_gym_members#index'

end
