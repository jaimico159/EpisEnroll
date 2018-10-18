class Laboratory < ApplicationRecord
  belongs_to :course
  belongs_to :group
  belongs_to :teacher
end
