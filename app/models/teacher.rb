class Teacher < ApplicationRecord
  has_many :laboratories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable
  enum status: { inactive: 0, active: 1}
end
