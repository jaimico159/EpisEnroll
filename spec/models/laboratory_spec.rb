require 'rails_helper'

#aserciones o probables aserciones
describe Laboratory do
  it "is valid with a course_id and quota" do
    laboratory = Laboratory.new(
      course_id: 'AKSS8655',
      quota: '15')
    expect(laboratory).to be_valid
  end

  it "is invalid without a course_id" do
    laboratory = Laboratory.new(course_id: nil)
    laboratory.valid?
    expect(laboratory.errors[:course_id]).to include("necesario")
  end

  it "is invalid without a quota" do
    laboratory = Laboratory.new(quota: nil)
    laboratory.valid?
    expect(laboratory.errors[:quota]).to include("necesario")
  end

  it "is invalid with an incorrect quota (> 25)" do
    laboratory = Laboratory.new(
      course_id: 'AKSS8655',
      quota: '30')
    laboratory.valid?
    expect(laboratory.errors[:email]).to include("can't be greater than 25")
  end

  it "is invalid with an incorrect quota (< 0)" do
    laboratory = Laboratory.new(
      course_id: 'AKSS8655',
      quota: '-1')
    laboratory.valid?
    expect(laboratory.errors[:email]).to include("can't be less than 0")
  end
end