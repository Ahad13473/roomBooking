class RoomController < ApplicationController
    def search_room
        @room = Room.new
        @date = params[:room][:select_a_date] if params[:room][:select_a_date].present?
        @day_on_that_date = Date.parse(@date).strftime("%A")
        
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.append("show_rooms", partial: "room/show_all_rooms",
            locals: {day: @day_on_that_date, date: @date, room: @room})
          end
        end

    end


    def room_slots
      @room = Room.find(params[:room][:name])
      @slots = @room.slots
      @day = params[:room][:day]
      @date = params[:room][:date]
      @slot = Slot.new
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append("show_room_slots", partial: "room/show_room_slots",
          locals: {day: @day, date: @date, room: @room, slots: @slots, slot: @slot, val: 0})
        end
      end
    end

    def check_availability
      debugger
    end
end
