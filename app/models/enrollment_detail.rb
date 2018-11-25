class EnrollmentDetail < ApplicationRecord
  belongs_to :enrollment_header
  belongs_to :laboratory, :foreign_key => [:course_id, :group_id]
  has_one :student, through: :enrollment_header
  enum status: { inactive: 0, active: 1}
end
