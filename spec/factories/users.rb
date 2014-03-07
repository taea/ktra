FactoryGirl.define do
  sequence :uid do |n|
    "#{n.to_s}"
  end
  factory :user, class: 'User' do
    uid
    name { Faker::Name.name }
    nickname { Faker::Name.name }
    image { Faker::Internet.url }
    token 'token'
    secret 'secret'
  end
end
