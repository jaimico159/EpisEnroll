class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, limit: 1, null: false, default: ""
      t.string :status, null: false, default: "A"
      t.text :description, null: true, default: ""

      t.timestamps
    end
  end
end
