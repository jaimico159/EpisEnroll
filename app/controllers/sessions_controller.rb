class SessionsController < ApplicationController

  def google_oauth2
    
    info = request.env['omniauth.auth'].info
    credentials = request.env['omniauth.auth'].credentials
    id_info = request.env['omniauth.auth'].extra.id_info

    user = nil

    if Admin.where(email: info['email']).first
      user = Admin.where(email: info['email']).first
    elsif Teacher.where(email: info['email']).first
      user = Teacher.where(email: info['email']).first
    else
      user = Student.where(email: info['email']).first
    end

    if user.nil?
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to root_path, alert: "User not found"
      return
    end

    if user.email.ends_with?('unsa.edu.pe') || user.email.eql?('jaimehuarsayarivera@gmail.com')
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      if user.is_a?(Student)
        sign_in user, event: :authentication
        redirect_to students_home_path
      elsif user.is_a?(Teacher)
        sign_in user, event: :authentication
        redirect_to teachers_home_path
      elsif user.is_a?(Admin)
        sign_in user, event: :authentication
        redirect_to admins_home_path
      end
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
      flash[:notice] = "You must be a EPIS member to do that."
      redirect_to '/', alert: "You must be a member of EPIS to do that."
    end
  end


  def destroy
    session[:user_id] = nil
    session.delete(:user_id)
    redirect_to root_path
  end
end
