class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum admin_role: { admin: 0, director: 1, secretary: 2, administrative: 3 }
  enum status: { inactive: 0, active: 1}
end
