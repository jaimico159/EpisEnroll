class AddTeacherToLaboratories < ActiveRecord::Migration[5.2]
  def change
    add_reference :laboratories, :teacher, foreign_key: true
  end
end
