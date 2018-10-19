class EnrollmentHeader < ApplicationRecord
  belongs_to :semester
  belongs_to :student
  has_many :enrollment_details
end
