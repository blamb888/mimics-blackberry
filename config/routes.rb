Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :calendars do
    resources :events, only: [:create]
    member do
      get '/show_month', to: 'calendars#show_month', as: :month_view
      get '/show_day', to: 'calendars#show_day', as: :day_view
    end
  end
  resources :events, only: [:edit, :update, :destroy]
end
