BusSystem::Application.routes.draw do
  resources :stations, :except => [:new, :edit]
  resources :lines, :except => [:new, :edit]
  match('/', {:via => :get, :to => 'mains#index'})
end
