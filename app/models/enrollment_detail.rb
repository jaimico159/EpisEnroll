class EnrollmentDetail < ApplicationRecord
  belongs_to :enrollment_header, counter_cache: true
  belongs_to :laboratory, :foreign_key => [:course_id, :group_id]
  enum status: { inactive: 0, active: 1}
end
