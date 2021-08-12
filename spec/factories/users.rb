FactoryBot.define do
  factory :user do
    name {'山田太郎'}
    email {Faker::Internet.free_email}
    password {'123abc'}
    password_confirmation {password}
    number {123456}
    division_id {2}
    office_id {2}
  end
end