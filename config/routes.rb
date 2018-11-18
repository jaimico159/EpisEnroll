Rails.application.routes.draw do
  root to: "home#show"
  
  namespace :admins do
    resources :admins
    resources :administratives
    resources :secretaries
    resources :directors
  end

  devise_for :admins
  devise_for :teachers
  devise_for :students
    
  get 'students/home', to: 'students#home'
  get 'admins/home', to: 'admins#home'
  get 'teachers/home', to: 'teachers#home'

  # Importante para usar las rutas de rails debes crear los siguiente: resources :'tumodelo'
  resources :admins
  resources :students
  resources :teachers
  resources :semesters
  resources :courses
  resources :laboratories
  

  
  get 'auth/:provider/callback', to: 'sessions#google_oauth2'
  get 'auth/failure', to: redirect('/')

  resources :sessions, only: [:create, :destroy]
  #devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
