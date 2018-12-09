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

  # callbacks
  after_save :attach_enrollment_header
  before_destroy :delete_enrollment_information
  enum status: { inactive: 0, active: 1}
  
  #validates
  validates :cui, uniqueness: {message: "ya existe"}, length: {is: 8, message: "debe tener 8 digitos"}
  validates :first_name, presence: {message: "necesario"}
  validates :last_name, presence: {message: "necesario"}
  validates :email, presence: {message: "necesario"}, uniqueness: {message: "ya existe"}

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def unsa_full_name
    "#{last_name}, #{first_name}"
  end

  def in_authorized_date?
    today = Date.today
    today >= clasification.start_date && today <= clasification.finish_date
  end

  private

  def attach_enrollment_header
    enrollment_header = EnrollmentHeader.new
    enrollment_header.semester = Semester.last
    enrollment_header.student = self
    enrollment_header.save
  end

  def delete_enrollment_information
    enrollment_header.enrollment_details.destroy_all
    enrollment_header.destroy
  end

end
