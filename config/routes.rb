Rails.application.routes.draw do
  devise_for :admins
  devise_for :teachers
  devise_for :students
  
  # Importante para usar las rutas de rails debes crear los siguiente: resources :'tumodelo'
  get '/admins/admin_views' => 'admins#admin_views'
  get '/admins/admin_views/new' => 'admins#new_admin'
  get '/admins/admin_views/:id' => 'admins#show_admin'
  get '/admins/admin_views/:id/edit' => 'admins#edit_admin'

  get '/admins/administrative_views' => 'admins#administrative_views'
  get '/admins/administrative_views/new' => 'admins#new_administrative'
  get '/admins/administrative_views/:id' => 'admins#show_administrative'
  get '/admins/administrative_views/:id/edit' => 'admins#edit_administrative'

  resources :admins
  resources :students
  resources :teachers
  resources :semesters
  resources :courses
  resources :laboratories


  get 'auth/:provider/callback', to: 'sessions#google_oauth2'
  get 'auth/failure', to: redirect('/')

  resources :sessions, only: [:create, :destroy]
  root to: "home#show"
  #devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
