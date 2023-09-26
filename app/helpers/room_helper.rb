module RoomHelper
    def room_names
       Room.all.count > 0 ?  @room = Room.all.map { |room| [room.name, room.id] } : @room = []
    end

    def booked_by_user(slot, date, room)
        if_found = Slot.joins(:booked_slot)
                   .where(booked_slots: {slot_id: slot.id, on_date: date, room_id: room})
                   .pluck("booked_slots.email")
                   .map {|email| {email: email}}

        if_found.empty? ? '-' : if_found[0][:email]
    end

    def if_already_booked(slot, date, room)
        if_booked = Slot.joins(:booked_slot)
                        .where(booked_slots: {slot_id: slot.id, on_date: date, room_id: room})

        if_booked.present? ? true : false 
    end
end
