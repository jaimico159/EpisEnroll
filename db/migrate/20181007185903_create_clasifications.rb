class CreateClasifications < ActiveRecord::Migration[5.2]
  def change
    create_table :clasifications do |t|
      t.integer :value, limit: 1, null: false, unique: true
      t.string :name, limit: 40, null: false, unique: true
      t.date :start_date
      t.date :finish_date
      t.text :description, limit: 100, null: true
      t.string :status, limit: 1, null: false

      t.timestamps
    end
  end
end
