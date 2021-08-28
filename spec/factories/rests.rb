FactoryBot.define do
  factory :rest do
    holiday_id {2}
    rest_day {'2021-01-01'}
    association :user
  end
end
