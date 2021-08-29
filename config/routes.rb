Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#welcome'
  get '/choirs', to: 'choirs#index'
  get '/climbing_gyms', to: 'climbing_gyms#index'
  get '/climbing_gyms/:id', to: 'climbing_gyms#show'
  get '/gym_members', to: 'gym_members#index'
end
