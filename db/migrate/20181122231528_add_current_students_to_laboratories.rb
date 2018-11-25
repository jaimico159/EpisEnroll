class AddCurrentStudentsToLaboratories < ActiveRecord::Migration[5.2]
  def change
    add_column :laboratories, :current_students, :integer, limit: 2, default: 0
  end
end
