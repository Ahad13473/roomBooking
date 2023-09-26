# spec/models/booked_slot_spec.rb

require 'rails_helper'

RSpec.describe BookedSlot, type: :model do
  let(:valid_attributes) do
    {
      name: 'Joel Fong',
      email: 'Joel@example.com',
      slot: Slot.new # Assuming you have a valid Slot instance or you can create one here
    }
  end

  it 'is valid with valid attributes' do
    booked_slot = BookedSlot.new(valid_attributes)
    expect(booked_slot).to be_valid
  end

  it 'is not valid without a name' do
    invalid_attributes = valid_attributes.merge(name: nil)
    booked_slot = BookedSlot.new(invalid_attributes)
    expect(booked_slot).not_to be_valid
  end

  it 'is not valid without an email' do
    invalid_attributes = valid_attributes.merge(email: nil)
    booked_slot = BookedSlot.new(invalid_attributes)
    expect(booked_slot).not_to be_valid
  end

  it 'is not valid with an invalid email format' do
    invalid_attributes = valid_attributes.merge(email: 'invalid_email')
    booked_slot = BookedSlot.new(invalid_attributes)
    expect(booked_slot).not_to be_valid
  end

  it 'belongs to a Slot' do
    association = described_class.reflect_on_association(:slot)
    expect(association.macro).to eq :belongs_to
  end
end
