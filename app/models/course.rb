class Course < ApplicationRecord
  has_many :laboratories
  enum status: { inactive: 0, active: 1}

  validates :code, presence: {message: "necesario"}, uniqueness: {message: "ya existe"}
  validates :name, presence: {message: "necesario"}

  def available_laboratories
    labs_array = laboratories.select { |lab| 
      lab.current_students < lab.quota
    }.map { |lab|
      [lab.group_id, lab.group.name]
    }
    labs_array
  end
end
