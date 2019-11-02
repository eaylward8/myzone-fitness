Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'athletes#index'

  resources :athletes, only: %i[index show]
  resources :challenge_totals, only: :index
end
