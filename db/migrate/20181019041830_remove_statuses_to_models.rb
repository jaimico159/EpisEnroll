class RemoveStatusesToModels < ActiveRecord::Migration[5.2]
  def change
    remove_column :clasifications, :status
    remove_column :semesters, :status
    remove_column :enrollment_headers, :status
    remove_column :enrollment_details, :status
    remove_column :laboratories, :status
    remove_column :courses, :status
    remove_column :groups, :status
    remove_column :teachers, :status
  end
end
