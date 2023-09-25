class Slot < ApplicationRecord
  attr_accessor :select_availability, :name, :email
  belongs_to :room
end
