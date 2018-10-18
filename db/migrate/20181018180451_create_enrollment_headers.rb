class CreateEnrollmentHeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollment_headers do |t|
      t.integer :laboratory_counter, limit: 1, null: false, default: 0
      t.text :description, null: true, default: ""
      t.string :status, null: false, default: "A"

      t.timestamps
    end
  end
end
