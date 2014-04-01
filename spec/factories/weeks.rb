FactoryGirl.define do
  factory :week, class: 'Week' do
    start_date { Date.current }
    end_date { Date.current }
  end
end
