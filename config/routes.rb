Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students
  #devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
