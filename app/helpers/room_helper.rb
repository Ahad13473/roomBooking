module RoomHelper
    def room_names
       Room.all.count > 0 ?  Room.all.map { |room| [room.name, room.id] } : []
    end

    def booked_by_user(slot, date, room)
        found = BookedSlot.find_by(slot_id: slot.id, on_date: date, room_id: room)
        found ? found.email : '-'
    end

    def if_already_booked(slot)
       slot.booked_slot ? true : false
    # true
    end
end
