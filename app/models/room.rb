class Room < ApplicationRecord
    attr_accessor :select_a_date, :day, :date

    has_many :slots
end
