Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'athletes#index'

  resources :athletes, only: %i[index show]
  get 'line_chart_data', to: 'athletes#line_chart_data'
end
