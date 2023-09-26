# spec/features/room_helper_spec.rb

require 'rails_helper'

RSpec.feature 'RoomHelper', type: :feature do
  scenario 'room_names returns room names and IDs' do
    room = create(:room, name: 'Sample Room') # Assuming you have FactoryBot set up
    visit some_path # Replace with the actual path where you use room_names in your view
    expect(page).to have_select('Room', options: [['Sample Room', room.id]])
  end

  scenario 'booked_by_user returns the correct email' do
    room = create(:room)
    slot = create(:slot, room: room)
    booked_slot = create(:booked_slot, slot: slot, email: 'john@example.com') # Assuming you have FactoryBot set up
    visit some_path # Replace with the actual path where you use booked_by_user in your view
    expect(page).to have_content('john@example.com')
  end

  scenario 'if_already_booked returns true when a slot is booked' do
    room = create(:room)
    slot = create(:slot, room: room)
    create(:booked_slot, slot: slot) # Assuming you have FactoryBot set up
    visit some_path # Replace with the actual path where you use if_already_booked in your view
    expect(page).to have_content('true')
  end

  scenario 'if_already_booked returns false when a slot is not booked' do
    room = create(:room)
    slot = create(:slot, room: room)
    visit some_path # Replace with the actual path where you use if_already_booked in your view
    expect(page).to have_content('false')
  end
end
