class AddCourseToLaboratories < ActiveRecord::Migration[5.2]
  def change
    add_reference :laboratories, :course, foreign_key: true
  end
end
