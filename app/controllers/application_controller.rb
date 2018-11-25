class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if current_admin
      current_admin
    elsif current_teacher
      current_teacher
    elsif current_student
      current_student
    else
      nil
    end
  end
end
