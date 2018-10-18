class EnrollmentHeader < ApplicationRecord
  belongs_to :semester
  belongs_to :student
  has_many :enrollent_details
end
