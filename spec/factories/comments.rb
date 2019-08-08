FactoryBot.define do
  factory :comment do
  	for_category

  	trait :for_category do
	    author { "Mystring String ." }
	    content { "MyText" }
	    association :commentable, factory: :category
	  end

	  trait :for_category_post do
	    author { "Mystring String ." }
	    content { "MyText" }
	    association :commentable, factory: :category_post
	  end
  end
end
