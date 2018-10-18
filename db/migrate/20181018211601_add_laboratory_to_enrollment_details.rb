class AddLaboratoryToEnrollmentDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :enrollment_details, :course, foreign_key: true
    add_reference :enrollment_details, :group, foreign_key: true
  end
end
