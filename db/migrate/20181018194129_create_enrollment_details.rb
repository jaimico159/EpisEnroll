class CreateEnrollmentDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollment_details do |t|
      t.text :description, null: true, default: ""
      t.string :status, null: false, default: "A"

      t.timestamps
    end
  end
end
