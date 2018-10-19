class AddGroupToLaboratories < ActiveRecord::Migration[5.2]
  def change
    add_reference :laboratories, :group, foreign_key: true
  end
end
