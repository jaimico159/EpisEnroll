require 'rails_helper'

#aserciones o probables aserciones
describe Course do
  it "is valid with a code and name" do
    course = Course.new(
      code: 'AEAS2345',
      name: 'Tecnologia de Objeto')
    expect(course).to be_valid
  end

  it "is invalid without a code" do
    course = Course.new(code: nil)
    course.valid?
    expect(course.errors[:code]).to include("necesario")
  end

  it "is invalid without a name" do
    course = Course.new(name: nil)
    course.valid?
    expect(course.errors[:name]).to include("necesario")
  end

  it "is valid with its laboratory" do
  	course = Course.new
  	expect(course.has_laboratory).to be true
  end

  it "is invalid if the labs in the course are more than in the db" do
  	course = Course.new
  	expect(course.available_laboratories.lenght).to > laboratories.select 
  end
end