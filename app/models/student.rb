class Student < ApplicationRecord

  belongs_to :clasification
  has_one :enrollment_header
  has_many :enrollment_details, through: :enrollment_header
  has_one :semester, through: :enrollment_header
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :validatable
  enum status: { inactive: 0, active: 1}

  def full_name
    "#{first_name} #{last_name}"
  end

  def unsa_full_name
    "#{last_name}, #{first_name}"
  end
end
