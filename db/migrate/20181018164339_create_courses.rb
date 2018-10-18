class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name, limit: 100, null: false, default: ""
      t.integer :code, limit: 8, null: false, default: ""
      t.boolean :has_laboratory, null: false, default: false
      t.string :status, null: false, default: "A"
      t.text :description, null: true, default: ""
      
      t.timestamps
    end
  end
end
