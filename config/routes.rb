Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :calendars do
    resources :events, only: [:create]
    resources :user_calendars, only: [:create]
    member do
      get '/show_month', to: 'calendars#show_month', as: :month_view
    end
  end
  resources :events, only: [:edit, :update, :destroy]

  get ":token/join", to: 'user_calendars#join'
end
