class Group < ApplicationRecord
  has_many :laboratories
  has_many :courses, through: :laboratories
  enum status: { inactive: 0, active: 1}
end
