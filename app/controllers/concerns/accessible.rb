module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_admin
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      case current_admin.role
      when "admin"
        redirect_to admins_admins_path && return
      when "director"
        redirect_to admins_directors_path && return
      when "secretary"
        redirect_to admins_secretaries_path && return
      when "administrative"
        redirect_to admins_administratives_path && return
      end
      
    elsif current_teacher
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to teachers_path && return
    elsif current_student
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to students_home_path && return
    end
  end
end