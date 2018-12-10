FactoryBot.define do
  factory :course do
    
  end

  factory :random_course, class: Course do
  	name {Faker::Educator.course}
	code {Faker::Number.number(7)}
	has_laboratory {Faker::Boolean.boolean}
	status :active
	description {Faker::Lorem.sentence}
  end


end
