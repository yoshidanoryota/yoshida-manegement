FactoryBot.define do
  factory :attendance do
    arrive_id {2}
    flying_id {1}
    attendance_day {'2021-01-01'}
    association :user
  end
end
