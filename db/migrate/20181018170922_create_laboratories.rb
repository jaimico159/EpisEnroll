class CreateLaboratories < ActiveRecord::Migration[5.2]
  def change
    create_table :laboratories do |t|
      t.integer :quota, limit: 2, null: false, default: 25
      t.text :description, null: true, default: ""
      t.string :status, null: false, default: "A"

      t.timestamps
    end
  end
end
