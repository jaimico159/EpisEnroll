class AddClasificationToStudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :clasification, foreign_key: true
  end
end
