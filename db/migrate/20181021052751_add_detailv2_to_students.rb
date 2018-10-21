class AddDetailv2ToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :oauth_token, :string
    add_column :students, :oauth_expires_at, :string
  end
end
