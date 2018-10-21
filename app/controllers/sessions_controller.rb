class SessionsController < ApplicationController
  def create
      user = User.from_omniauth(request.env["omniauth.auth"])
      if User.find_by_email(user.email)
        session[:user_id] = user.id
        redirect_to root_path
      end
    end


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
