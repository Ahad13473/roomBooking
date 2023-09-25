module RoomHelper
    def room_names
       Room.all.count > 0 ? Room.all.pluck(:name) : []
    end
end
