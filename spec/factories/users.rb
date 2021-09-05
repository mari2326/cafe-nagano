FactoryBot.define do
  factory :user do
    nickname   { 'aaaaaa' }
    email      { Faker::Internet.free_email }
    password   { '111111' }
    password_confirmation { password }
  end
end