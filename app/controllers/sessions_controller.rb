class SessionsController < ApplicationController
  def create
      user = Student.from_omniauth(request.env["omniauth.auth"])
      if Student.find_by_email(user.email)
        session[:user_id] = user.id
        redirect_to root_path
      end
    end


  def destroy
    session[:user_id] = nil
    session.delete(:user_id)
    redirect_to root_path
  end
end
