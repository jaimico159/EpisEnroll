class RemoveIdFromLaboratories < ActiveRecord::Migration[5.2]
  def change
    remove_column :laboratories, :id, :bigint
  end
end
