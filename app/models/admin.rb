class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable

  enum admin_role: { admin: 0, director: 1, secretary: 2, administrative: 3 }
  enum status: { inactive: 0, active: 1}
  
  #validates
  validates :first_name, presence: {message: "necesario"}
  validates :last_name, presence: {message: "necesario"}
  validates :email, presence: {message: "necesario"}, uniqueness: {message: "ya existe"}

  def full_name
    "#{first_name} #{last_name}"
  end
end
