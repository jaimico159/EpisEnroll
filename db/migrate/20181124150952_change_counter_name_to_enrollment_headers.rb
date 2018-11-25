class ChangeCounterNameToEnrollmentHeaders < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :enrollment_headers, :laboratory_counter, :enrollment_details_count
  end

  def self.down
    rename_column :enrollment_headers, :enrollment_details_count, :laboratory_counter
  end
end
