# frozen_string_literal: true

class UpdateUsersColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :google_token, :string
    add_column :students, :google_refresh_token, :string
    add_column :admins, :google_token, :string
    add_column :admins, :google_refresh_token, :string
  end
end
