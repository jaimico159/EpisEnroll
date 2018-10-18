class Laboratory < ApplicationRecord
  self.primary_keys = :course_id, :group_id
  belongs_to :course
  belongs_to :group
  belongs_to :teacher
  has_many :enrollment_details, :class_name => 'EnrollmentDetail', :foreign_key => [:course_id, :group_id]
end
