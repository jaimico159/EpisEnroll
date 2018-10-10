FactoryGirl.define do
  factory :course do
    name "MyString"
    code 1
    has_laboratory ""
    status "MyString"
    description "MyText"
    teacher_id nil
  end
end
