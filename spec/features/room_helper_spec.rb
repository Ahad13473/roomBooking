# spec/features/room_helper_spec.rb

require 'rails_helper'

RSpec.feature 'RoomHelper', type: :feature do
  scenario 'booked_by_user returns the correct email' do
    room = create(:room)
    slot = create(:slot, room: room)
    date = '2023-09-26'
    booked_slot = create(:booked_slot, slot: slot, email: 'john@example.com')
    email = booked_by_user(slot, date, room)
  end


  scenario 'if_already_booked returns true when a slot is booked' do
    room = create(:room)
    slot = create(:slot, room: room)
    create(:booked_slot, slot: slot)
  end

  scenario 'if_already_booked returns false when a slot is not booked' do
    room = create(:room)
    slot = create(:slot, room: room)
  end
end
