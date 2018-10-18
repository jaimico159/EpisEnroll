class AddEnrollmentHeaderToEnrollmentDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :enrollment_details, :enrollment_header, foreign_key: true
  end
end
