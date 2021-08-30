Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#welcome'
  get '/choirs', to: 'choirs#index'
<<<<<<< HEAD
  get '/choirs/:id', to: 'choirs#show'
=======
  get '/climbing_gyms', to: 'climbing_gyms#index'
  get '/climbing_gyms/:gym_id', to: 'climbing_gyms#show'
  get '/gym_members', to: 'gym_members#index'
  get '/gym_members/:member_id', to: 'gym_members#show'
  get '/climbing_gyms/:gym_id/gym_members', to: 'climbing_gym_gym_members#index'
>>>>>>> 10237bb2c59c73c8f61afa51127c7bdf4343a534
end
