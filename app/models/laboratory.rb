class Laboratory < ApplicationRecord
  self.primary_keys = :course_id, :group_id
  belongs_to :course
  belongs_to :group
  belongs_to :teacher
  has_many :enrollment_details, :class_name => 'EnrollmentDetail', :foreign_key => [:course_id, :group_id]
  enum status: { inactive: 0, active: 1}

  #validates
  validates :course_id, uniqueness: { scope: :group_id, message: "con ese grupo ya existe" }
  validates :quota, numericality: { only_integer: true , less_than_or_equal_to: 25, message: "debe ser menor o igual a 25"}
  validates :quota, numericality: { only_integer: true , greater_than_or_equal_to: 0, message: "debe ser mayor o igual a 0"}
end
