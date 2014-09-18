FactoryGirl.define do
  factory :post do
    title     { Faker::Lorem.words }
    content   { Faker::Lorem.paragraphs }
    category  { create(:category) }
  end
end
