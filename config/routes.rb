Rails.application.routes.draw do
  devise_for :admins
  devise_for :teachers
  devise_for :students

  resources :students

  get 'auth/:provider/callback', to: 'sessions#google_oauth2'
  get 'auth/failure', to: redirect('/')

  resources :sessions, only: [:create, :destroy]
  root to: "home#show"
  #devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
