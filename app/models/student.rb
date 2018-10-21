class Student < ApplicationRecord

  belongs_to :clasification
  has_one :enrollment_header
  has_many :enrollment_details, through: :enrollment_header
  has_one :semester, through: :enrollment_header
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :validatable
  enum status: { inactive: 0, active: 1}
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.course_codes = [1,2,54]
      user.first_name = auth.info.name
      user.email = auth.info.email
      user.encrypted_password = "xdxdxdxd"
      user.password = "sdsd1224"
      user.last_name = "perez"
      user.cui = 20160662
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.clasification_id = 2
       user.save!
    end
  end
end
