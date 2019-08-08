class Category < ApplicationRecord
	has_and_belongs_to_many :category_posts
	has_many :comments, as: :commentable, :dependent => :destroy
  validates :name, presence: true, format: { with: /\A((\b[A-Z][A-Za-z]{2,}\b)\s*)((\b[A-Za-z]{2,}\b)\s*)[\.]{1,}\Z/, message: "Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale" }
	
end
