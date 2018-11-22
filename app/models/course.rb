class Course < ApplicationRecord
  has_many :laboratories
  enum status: { inactive: 0, active: 1}

  validates :code, presence: {message: "necesario"}, uniqueness: {message: "ya existe"}
  validates :name, presence: {message: "necesario"}

end
