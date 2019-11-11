# frozen_string_literal: true

require 'signet/oauth_2/client'
class SessionsController < ApplicationController
  include Accessible
  skip_before_action :check_user, only: :destroy
  skip_before_action :verify_authenticity_token, only: :create

  def create
    # Get access tokens from the google server

    validator = GoogleIDToken::Validator.new
    begin
      payload = validator.check(params['idtoken'], ENV['GOOGLE_OAUTH_CLIENT_ID'], ENV['GOOGLE_OAUTH_CLIENT_ID'])
      # email = payload['email']
      user = if Admin.where(email: payload['email']).first
               Admin.where(email: payload['email']).first
             elsif Teacher.where(email: payload['email']).first
               Teacher.where(email: payload['email']).first
             else
               Student.where(email: payload['email']).first
      end

      if user.nil?
        session['devise.google_data'] = nil # Removing extra as it can overflow some session stores
        render json: { redirect_path: root_path }, status: :unauthorized, alert: 'User not found' # note, no :location or :status options
        return
      end

      if user.email.ends_with?('unsa.edu.pe') || user.email.eql?('jaimehuarsayarivera@gmail.com')
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        redirect_path = '/'
        if user.is_a?(Student)
          sign_in user, event: :authentication
          redirect_path = students_home_path
        elsif user.is_a?(Teacher)
          sign_in user, event: :authentication
          redirect_path = teachers_home_path
        elsif user.is_a?(Admin)
          sign_in user, event: :authentication
          case user.admin_role
          when 'admin'
            redirect_path = admins_admins_home_path
          when 'director'
            redirect_path = admins_directors_home_path
          when 'secretary'
            redirect_path = admins_secretaries_home_path
          when 'administrative'
            redirect_path = admins_administratives_home_path
          end
        end
        respond_to do |format|
          format.json { render json: { redirect_path: redirect_path } } # note, no :location or :status options
        end
      else
        session['devise.google_data'] = nil # Removing extra as it can overflow some session stores
        render json: { redirect_path: root_path }, status: :unauthorized, alert: 'You must be member of EPIS to do that.'
      end
    rescue GoogleIDToken::ValidationError => e
      render json: { redirect_path: root_path }, status: :unauthorized, alert: 'Something went wrong'
    end
  end

  def destroy
    session[:user_id] = nil
    session.delete(:user_id)
    redirect_to root_path
  end
end
