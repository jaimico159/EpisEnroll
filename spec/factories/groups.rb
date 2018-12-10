FactoryBot.define do
  factory :group do
    
  end

  factory :random_group, class: Group do
  	name {Faker::Name.initials(1)}
	description {Faker::Lorem.sentence}
	status :active
  end


end
