FactoryBot.define do
  factory :teacher do
    
  end

  factory :random_teacher, class: Teacher do
	first_name {Faker::Name.first_name}
	last_name {Faker::Name.last_name}
	description {Faker::Lorem.sentence}
	email {Faker::Internet.email}
	encrypted_password {Faker::Internet.password}
	status: :active
  end


end
