# spec/models/slot_spec.rb

require 'rails_helper'

RSpec.describe Slot, type: :model do
  let(:room) { Room.create(name: 'Sample Room') } # Create a room for testing

  let(:valid_attributes) do
    {
      room: room,
      slot_id: 1,
      name: 'Joel Fong',
      email: 'Joel@example.com'
    }
  end

  it 'is valid with valid attributes' do
    slot = Slot.new(valid_attributes)
    expect(slot).to be_valid
  end

  it 'belongs to a Room' do
    association = described_class.reflect_on_association(:room)
    expect(association.macro).to eq :belongs_to
  end

  it 'has one BookedSlot' do
    association = described_class.reflect_on_association(:booked_slot)
    expect(association.macro).to eq :has_one
  end

  it 'destroys associated BookedSlot when destroyed' do
    slot = Slot.create(valid_attributes)
    BookedSlot.create(slot_id: slot.slot_id, room_id: room.id) # Create an associated booked_slot

    expect {
      slot.destroy
    }.to change(BookedSlot, :count).by(-1)
  end
end
