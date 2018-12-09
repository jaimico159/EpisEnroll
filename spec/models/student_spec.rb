require 'rails_helper'

#aserciones o probables aserciones
describe Student do
  it "is valid with a cui, first_name, last_name and email" do
    student = Student.new(
      cui: 20178754,
      first_name: 'Aaron',
      last_name: 'Sumner',
      email: 'tester@example.com')
    expect(student).to be_valid
  end

  it "is invalid without a cui" do
    student = Student.new(cui: nil)
    student.valid?
    expect(student.errors[:cui]).to include("necesario")
  end

  it "is invalid without a first_name" do
    student = Student.new(first_name: nil)
    student.valid?
    expect(student.errors[:first_name]).to include("necesario")
  end

  it "is invalid without a last_name" do
    student = Student.new(last_name: nil)
    student.valid?
    expect(student.errors[:last_name]).to include("necesario")
  end

  it "is invalid without an email address" do
    student = Student.new(email: nil)
    student.valid?
    expect(student.errors[:email]).to include("necesario")
  end

  it "is valid with a full name" do
  	student = Student.new(
      first_name: 'Aaron',
      last_name: 'Sumner',
      email: 'tester@example.com')
  	expect(student.full_name).to eq('Aaron Sumner')
  end

  it "is valid with a Unsa full name" do
  	student = Student.new(
      first_name: 'Aaron',
      last_name: 'Sumner',
      email: 'tester@example.com')
  	expect(student.unsa_full_name).to eq('Sumner, Aaron')
  end


end