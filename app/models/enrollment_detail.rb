class EnrollmentDetail < ApplicationRecord
  belongs_to :enrollment_header
  belongs_to :laboratory, :foreign_key => [:course_id, :group_id]
end
