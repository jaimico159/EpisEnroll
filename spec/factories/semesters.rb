FactoryBot.define do
  factory :semester do
    is_even { false }
    start_date { "2018-10-12" }
    finist_date { "2018-10-12" }
    status { "MyString" }
    description { "MyText" }
  end
end
