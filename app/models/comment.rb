class Comment < ApplicationRecord
	belongs_to :commentable, polymorphic: true
	validates :author, presence: true, format: { with: /\A((\b[A-Z][A-Za-z]{2,}\b)\s*)((\b[A-Z][A-Za-z]{2,}\b)\s*)[\.]{1,}\Z/, message: "Your author must be at least 2 words and minimum is 2 characters with point and first letter id capitale" }
	validates :content, presence: true
end
