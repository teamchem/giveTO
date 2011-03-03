Giveto::Application.routes.draw do

  resources :users
  resource  :events
  resource  :sessions, :only => [:new, :create, :destroy]

  
  match '/contact', :to => "pages#contact"
  match '/about', :to => "pages#about"
  match '/help', :to => 'pages#help'
  
  match '/signup', :to => 'users#create'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  
  match '/events/show/:id', :to => 'events#show'
  match '/events/new', :to => 'events#new'
  match '/events/calendar', :to => 'error#pass_calendar_date'
  match '/events/calendar/:date', :to => 'events#calendar'
  match '/events/all', :to => 'events#all'
  
  root :to => 'pages#home'
  
  # Catch-all 404 redirect
  match '*a', :to => 'error#routing'
end