BusSystem::Application.routes.draw do
  resources :stations, :except => [:new]
  resources :lines, :except => [:new]
  match('/', {:via => :get, :to => 'main#index'})
end
