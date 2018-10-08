# frozen_string_literal: true

class DeviseCreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      ##########################
      t.string :firstname, limit: 45, null: false
      t.string :lastname, limit: 45, null: false
      t.string :email, limit: 40, null: true
      t.integer :cui, limit: 8, null: false, unique: true
      t.binary :has_certificate
      t.binary :is_enrolled
      t.integer :course_codes, array: true, default: []
      t.string :status, limit: 1, null: false
      t.text :description, limit: 100, null: true
      t.references :clasification_id

      t.timestamps
      ############################
     
    end

  end
end
