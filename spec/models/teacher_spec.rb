require 'rails_helper'

#aserciones o probables aserciones
describe teacher do
  it "is valid with a first_name, last_name and email" do
    teacher = Teacher.new(
      first_name: 'Aaron',
      last_name: 'Sumner',
      email: 'tester@example.com')
    expect(teacher).to be_valid
  end

  it "is invalid without a first_name" do
    teacher = Teacher.new(first_name: nil)
    teacher.valid?
    expect(teacher.errors[:first_name]).to include("necesario")
  end

  it "is invalid without a last_name" do
    teacher = Teacher.new(last_name: nil)
    teacher.valid?
    expect(teacher.errors[:last_name]).to include("necesario")
  end

  it "is invalid without an email address" do
    teacher = Teacher.new(email: nil)
    teacher.valid?
    expect(teacher.errors[:email]).to include("necesario")
  end

  it "is valid with a full name" do
  	teacher = Teacher.new(
      first_name: 'Aaron',
      last_name: 'Sumner',
      email: 'tester@example.com')
  	expect(teacher.full_name).to eq('Aaron Sumner')
  end
end
