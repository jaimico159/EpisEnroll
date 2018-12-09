Rails.application.routes.draw do
  root to: "home#show"

  devise_for :admins
  devise_for :teachers
  devise_for :students
  
  get 'admins/admins/home', to: 'admins/admins#home'
  get 'admins/directors/home', to: 'admins/directors#home'
  get 'admins/secretaries/home', to: 'admins/secretaries#home'
  get 'admins/administratives/home', to: 'admins/administratives#home'
  get 'students/home', to: 'students#home'
  get 'teachers/home', to: 'teachers#home'
  get 'teachers/my_labs', to: 'teachers#my_labs'

  get 'laboratories/lab_dash/:id', to: 'laboratories#lab_dash', as: 'laboratories_lab_dash'
  
  
  get 'students/validate_pdf', to: 'students#validate_pdf'
  post 'students/validate', to: 'students#validate'
  get 'students/enrollment', to: 'students#enrollment'
  post 'students/enroll_student', to: 'students#enroll_student'
  # Importante para usar las rutas de rails debes crear los siguiente: resources :'tumodelo'
  
  namespace :admins do
    resources :admins
    resources :administratives
    resources :secretaries
    resources :directors
  end

  resources :admins
  resources :students
  resources :teachers
  resources :semesters
  resources :clasifications
  resources :courses do
    post 'share'
    get 'unused_groups' => 'courses#unused_groups'
  end
  resources :laboratories
  resources :enrollment_details
  
  get 'auth/:provider/callback', to: 'sessions#google_oauth2'
  get 'auth/failure', to: redirect('/')

  resources :sessions, only: [:create, :destroy]
  #devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
