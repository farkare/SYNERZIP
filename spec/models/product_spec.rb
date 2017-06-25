require 'rails_helper'

RSpec.describe Product, :type => :model do
	subject { described_class.new(name: "Product name", price: 223, status: 0, type: 'Pen', description: "Product desc", inward_date: DateTime.now) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do 
  	subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do 
  	subject.price = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a status" do 
  	subject.status = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a inward_date" do 
  	subject.inward_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a type" do 
  	subject.type = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do 
  	subject.description = nil
    expect(subject).to_not be_valid
  end

  it "should have attribute type" do
    expect(subject).to have_attribute :type
  end

  it "should initialize successfully as an instance of the described class" do
    expect(subject).to be_a_kind_of described_class
  end
end
