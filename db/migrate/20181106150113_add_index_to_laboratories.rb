class AddIndexToLaboratories < ActiveRecord::Migration[5.2]
  def change
    execute "ALTER TABLE laboratories ADD PRIMARY KEY (course_id, group_id);"
  end
end
