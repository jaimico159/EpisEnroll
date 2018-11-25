desc 'Counter cache for Enrollment Header has many Enrollment Details'

task enrollment_details_counter: :environment do
  EnrollmentHeader.reset_column_information
  EnrollmentHeader.find_each do |header|
    EnrollmentHeader.reset_counters header.id, :enrollment_details  
  end
end