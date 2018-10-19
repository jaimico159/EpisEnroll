class Course < ApplicationRecord
  has_many :laboratories
  enum status: { inactive: 0, active: 1}
end
