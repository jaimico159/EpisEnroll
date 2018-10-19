class Group < ApplicationRecord
  has_many :laboratories
  has_many :courses, through: :laboratories
end
