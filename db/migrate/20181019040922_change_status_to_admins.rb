class ChangeStatusToAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :status
  end
end
