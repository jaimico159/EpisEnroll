class Laboratory < ApplicationRecord
  self.primary_keys = :course_id, :group_id
  belongs_to :course
  belongs_to :group
  belongs_to :teacher
end
