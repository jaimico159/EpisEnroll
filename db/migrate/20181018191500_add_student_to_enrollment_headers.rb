class AddStudentToEnrollmentHeaders < ActiveRecord::Migration[5.2]
  def change
    add_reference :enrollment_headers, :student, foreign_key: true, unique: true
  end
end
