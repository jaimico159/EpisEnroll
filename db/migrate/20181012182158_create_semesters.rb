class CreateSemesters < ActiveRecord::Migration[5.2]
  def change
    create_table :semesters do |t|
      t.boolean :is_even, null: false
      t.date :start_date
      t.date :finist_date, null: true
      t.string :status, null: false
      t.text :description, limit: 100, null: true

      t.timestamps
    end
  end
end
