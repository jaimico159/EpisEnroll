class EnrollmentDetail < ApplicationRecord
  belongs_to :enrollment_header, counter_cache: true
  belongs_to :laboratory, :foreign_key => [:course_id, :group_id]
  has_one :course, through: :laboratory
  has_one :group, through: :laboratory
  enum status: { inactive: 0, active: 1}
end
