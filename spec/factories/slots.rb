
FactoryBot.define do
  factory :slot do
    time { Time.now }
    status { true }
    association :room
  end
end
