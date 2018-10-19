class EnrollmentHeader < ApplicationRecord
  belongs_to :semester
  belongs_to :student
  has_many :enrollment_details
  enum status: { inactive: 0, active: 1}
end
