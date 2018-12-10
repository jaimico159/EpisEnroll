FactoryBot.define do
  factory :student do
    
  end

  factory :random_student, class: Student do
	first_name {Faker::Name.first_name}
	last_name {Faker::Name.last_name}
	cui {Faker::Number.number(8)}
	authorized {Faker::Boolean.boolean}
	certificate_uploaded {Faker::Boolean.boolean}
	enrolled {Faker::Boolean.boolean}
	description {Faker::Lorem.sentence}
	email {Faker::Internet.email}
	encrypted_password {Faker::Internet.password}
	status: :active
  end

end
