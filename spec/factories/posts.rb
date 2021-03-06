FactoryBot.define do
  factory :post do
    name               { 'aaaaa' }
    text               { 'あいうえお' }
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
