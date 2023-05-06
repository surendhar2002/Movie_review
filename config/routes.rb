Rails.application.routes.draw do


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :movies do
    resources :reviews
    resources :ratings
  end

  root "movies#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
