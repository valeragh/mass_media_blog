require 'rails_helper'
require 'carrierwave/test/matchers'

describe Post do
	include CarrierWave::Test::Matchers

  it "is invalid without a factory name" do
    post = build(:post, name: nil)
    post.valid?
    expect(post.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid length a factory name" do
    post = build(:post, name: 'o test')
    post.valid?
    expect(post.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid number words a factory name" do
    post = build(:post, name: 'test')
    post.valid?
    expect(post.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid capital first letter a factory name" do
    post = build(:post, name: 'test test')
    post.valid?
    expect(post.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "is invalid without point a factory name" do
    post = build(:post, name: 'Test test')
    post.valid?
    expect(post.errors[:name]).to include("Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale")
  end

  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end

  context 'the all versions version' do

    it "has the correct format" do
      post = build(:post)
      expect(post.file).to be_format('JPEG')
    end
  end
end

