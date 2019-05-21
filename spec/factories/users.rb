FactoryBot.define do
  factory :user do
    email { 'aaa@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
