class CreateSemesters < ActiveRecord::Migration[5.2]
  def change
    create_table :semesters do |t|
      t.integer :is_even, null: false
      t.date :start_date, null: false
      t.date :finish_date, null: true
      t.integer :status, null: false
      t.string :description, limit:50, null: true

      t.timestamps
    end
  end
end
