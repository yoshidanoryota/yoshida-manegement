FactoryBot.define do
  factory :out do
    off_id {2}
    extra_id {1}
    out_day {'2021-01-01'}
    association :user
  end
end
