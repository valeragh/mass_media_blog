FactoryBot.define do
  factory :category_post do
    name { "MyString string ." }
    description { "MyText" }
    file { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/test.jpg'))) }
  end

  factory :invalid_category_post, parent: :category_post do
  	name { nil }
  end
end
