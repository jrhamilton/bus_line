BusSystem::Application.routes.draw do
  resources :stations, :except => [:new, :edit]
  resources :lines, :except => [:new, :edit]
  resources :stops

  resources :stations do
    resources :stops
  end

  resources :lines do
    resources :stops
  end

 root :to => 'mains#index'
end
