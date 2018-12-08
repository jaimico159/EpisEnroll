class EnrollmentDetail < ApplicationRecord
  belongs_to :enrollment_header, counter_cache: true, dependent: :destroy
  belongs_to :laboratory, :foreign_key => [:course_id, :group_id]
  has_one :student, through: :enrollment_header
  has_one :course, through: :laboratory
  has_one :group, through: :laboratory
  before_destroy :set_student_enrollment_status
  enum status: { inactive: 0, active: 1}

  private

  def set_student_enrollment_status
    student.update(enrolled: false)
  end
end
