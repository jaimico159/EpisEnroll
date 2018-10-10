class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name, limit: 45, null: false
      t.integer :code
      t.binary :has_laboratory
      t.string :status, limit: 1, null: false
      t.text :description, limit: 100, null: true
      t.references :teacher_id, foreign_key: true, null: true

      t.timestamps
    end
  end
end
