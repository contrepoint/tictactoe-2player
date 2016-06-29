FactoryGirl.define do
  factory :user do
    email    'a@a.com'
    password "123456"
    password_confirmation "123456"

    factory :user2 do
      email 'b@b.com'
    end
  end
end