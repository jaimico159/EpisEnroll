class AddSemesterToEnrollmentHeaders < ActiveRecord::Migration[5.2]
  def change
    add_reference :enrollment_headers, :semester, foreign_key: true
  end
end
