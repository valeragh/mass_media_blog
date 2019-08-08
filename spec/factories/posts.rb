FactoryBot.define do
  factory :post do
    name { "MyString string ." }
    description { "MyText" }
    file { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/test.jpg'))) }
  end

  factory :invalid_post, parent: :post do
  	name { nil }
  end
end
