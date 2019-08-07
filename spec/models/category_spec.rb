require 'rails_helper'

describe Category do

  it "is invalid without a factory name" do
    category = build(:category, name: nil)
    category.valid?
    expect(category.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid length a factory name" do
    category = build(:category, name: 'o test')
    category.valid?
    expect(category.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid number words a factory name" do
    category = build(:category, name: 'test')
    category.valid?
    expect(category.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid capital first letter a factory name" do
    category = build(:category, name: 'test test')
    category.valid?
    expect(category.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid without point a factory name" do
    category = build(:category, name: 'Test test')
    category.valid?
    expect(category.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "has a valid factory" do
    expect(build(:category)).to be_valid
  end
end
