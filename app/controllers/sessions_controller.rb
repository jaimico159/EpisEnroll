class SessionsController < ApplicationController
  def create

    student = Student.from_omniauth(request.env["omniauth.auth"])
    puts user.email
  end

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
      redirect_to root, alert: "User not found"
      return
    end

    puts "PONIENDO LA INFO"
    puts "<<<<< #{info.email} <<<< email"
    puts "<<< #{info.email.eql?('jaimehuarsayarivera@gmail.com')} <<<"

    if info.email.ends_with?('unsa.edu.pe') || info.email.eql?('jaimehuarsayarivera@gmail.com')
      puts "<<<<< #{info.email} <<<< email"
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect user, event: :authentication
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
