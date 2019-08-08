require 'rails_helper'

describe Comment do

  it "is invalid without a factory author" do
    comment = build(:comment, author: nil)
    comment.valid?
    expect(comment.errors[:author]).to include("can't be blank", "Your author must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid without a factory content" do
    comment = build(:comment, content: nil)
    comment.valid?
    expect(comment.errors[:content]).to include("can't be blank")
  end

  it "is invalid length a factory author" do
    comment = build(:comment, author: 'o test')
    comment.valid?
    expect(comment.errors[:author]).to include("Your author must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid number words a factory author" do
    comment = build(:comment, author: 'test')
    comment.valid?
    expect(comment.errors[:author]).to include("Your author must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid capital first letter a factory author" do
    comment = build(:comment, author: 'test test')
    comment.valid?
    expect(comment.errors[:author]).to include("Your author must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid without point a factory author" do
    comment = build(:comment, author: 'Test test')
    comment.valid?
    expect(comment.errors[:author]).to include("Your author must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid without point a factory author" do
    comment = build(:comment, author: 'Test Test')
    comment.valid?
    expect(comment.errors[:author]).to include("Your author must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "has a valid factory" do
    expect(build(:comment)).to be_valid
  end
end
