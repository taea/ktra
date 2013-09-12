FactoryGirl.define do
  factory :task, class: 'Task' do
    title { Faker::Name.title }
    point { 1 }
    memo { Faker::Lorem.paragraphs.join("\n") }
  end
end
