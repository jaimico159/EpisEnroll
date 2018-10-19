class AddIntStatusesToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :clasifications, :status, :integer, limit: 1, default: 1
    add_column :students, :status, :integer, limit: 1, default: 0
    add_column :semesters, :status, :integer, limit: 1, default: 1
    add_column :enrollment_headers, :status, :integer, limit: 1, default: 1
    add_column :enrollment_details, :status, :integer, limit: 1, default: 1
    add_column :laboratories, :status, :integer, limit: 1, default: 1
    add_column :courses, :status, :integer, limit: 1, default: 1
    add_column :groups, :status, :integer, limit: 1, default: 1
    add_column :teachers, :status, :integer, limit: 1, default: 1
    add_column :admins, :status, :integer, limit: 1, default: 1
  end
end
