require 'rails_helper'

#aserciones o probables aserciones
describe Admin do
  it "is valid with a first_name, last_name and email" do
    admin = Admin.new(
      first_name: 'Aaron',
      last_name: 'Sumner',
      email: 'tester@example.com')
    expect(admin).to be_valid
  end

  it "is invalid without a first_name" do
    admin = Admin.new(first_name: nil)
    admin.valid?
    expect(admin.errors[:first_name]).to include("necesario")
  end

  it "is invalid without a last_name" do
    admin = Admin.new(last_name: nil)
    admin.valid?
    expect(admin.errors[:last_name]).to include("necesario")
  end

  it "is invalid without an email address" do
    admin = Admin.new(email: nil)
    admin.valid?
    expect(admin.errors[:email]).to include("necesario")
  end

  it "is valid with a full name" do
  	admin = Admin.new(
      first_name: 'Aaron',
      last_name: 'Sumner',
      email: 'tester@example.com')
  	expect(admin.full_name).to eq('Aaron Sumner')
  end
end