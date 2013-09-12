FactoryGirl.define do
  factory :iteration, class: 'Iteration' do
    start_date { Date.current }
    end_date { Date.current }
  end
end
