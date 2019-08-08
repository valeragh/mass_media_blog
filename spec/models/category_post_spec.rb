require 'rails_helper'
require 'carrierwave/test/matchers'

describe CategoryPost do
	include CarrierWave::Test::Matchers

  it "is invalid without a factory name" do
    category_post = build(:category_post, name: nil)
    category_post.valid?
    expect(category_post.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid length a factory name" do
    category_post = build(:category_post, name: 'o test')
    category_post.valid?
    expect(category_post.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid number words a factory name" do
    category_post = build(:category_post, name: 'test')
    category_post.valid?
    expect(category_post.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid capital first letter a factory name" do
    category_post = build(:category_post, name: 'test test')
    category_post.valid?
    expect(category_post.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid without point a factory name" do
    category_post = build(:category_post, name: 'Test test')
    category_post.valid?
    expect(category_post.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "has a valid factory" do
    expect(build(:category_post)).to be_valid
  end

  context 'the all versions version' do

    it "has the correct format" do
      category_post = build(:category_post)
      expect(category_post.file).to be_format('JPEG')
    end
  end
end

