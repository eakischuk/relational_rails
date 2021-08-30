Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/choirs', to: 'choirs#index'
  get '/choirs/:id', to: 'choirs#show'
end
