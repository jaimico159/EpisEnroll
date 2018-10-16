class CreateSemesters < ActiveRecord::Migration[5.2]
  def change
    create_table :semesters do |t|
      t.boolean :is_even, null: false
      t.date :start_date, null: false
      t.date :finish_date, null: true
      t.string :status, limit: 1, null: false
      t.text :backup, null: true

      t.timestamps
    end
  end
end
