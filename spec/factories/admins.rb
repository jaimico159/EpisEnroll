FactoryBot.define do
  factory :admin do
    
  end

  factory :random_admin, class: Admin do
  	first_name {Faker::Name.first_name}
  	last_name {Faker::Name.first_name}
  	admin_role {Faker::Number.between(1, 4)}
  	description {Faker::Lorem.sentence}
  	email {Faker::Internet.email}
  	encrypted_password {Faker::Internet.password}
  	status :active
  end

end
