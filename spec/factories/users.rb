FactoryGirl.define do
  factory :user do
    email    'abc@a.com'
    password "123456"
    password_confirmation "123456"

    factory :user2 do
      email 'abc@b.com'
    end
  end
end