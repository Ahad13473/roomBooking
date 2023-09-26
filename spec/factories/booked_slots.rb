
FactoryBot.define do
  factory :booked_slot do
    slot_id { FactoryBot.create(:slot).id }
    name { 'John Doe' }
    email { 'johndoe@example.com' }
    on_day { 'Monday' }
    on_date { Date.today }
    room_id { FactoryBot.create(:room).id }
  end
end
