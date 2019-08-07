FactoryBot.define do
  factory :category do
    name { "MyString string ." }
    description { "MyText" }
  end

  factory :invalid_category, parent: :category do
  	name { nil }
  end

end
