class RoomController < ApplicationController
    def search_room
        @room = Room.new
        @date = params[:room][:select_a_date] if params[:room][:select_a_date].present?
        if @date.present?
          @day_on_that_date = Date.parse(@date).strftime("%A")
        else
          @day_on_that_date = nil
        end
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.update("show_rooms", partial: "room/show_all_rooms",
            locals: {day: @day_on_that_date, date: @date, room: @room})
          end
        end

    end #search_room


    def room_slots
      @room = Room.find_by(params[:room_id])
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
    end #room_slots

    def make_booking
     if find_already_booked? #it should be true on not finding any relative booking
      make_new_booking #make new booking
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("booking_message", "Booking Saved Successfully!")
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("booking_message", "Already Booked Choose other")
        end
      end
    end
    end #make_booking

    private
    def find_already_booked?
      slot = params[:slot] if params[:slot]
      found =  Slot.joins(:booked_slot)
                   .where(booked_slots: {slot_id: slot[:slot_id], on_date: slot[:date], room_id: slot[:room]})
                   .pluck("booked_slots.id")
      found.empty? ? true : false
    end #find_already_booked

    def make_new_booking
      slot = params[:slot] if params[:slot]
      @slot_booked = BookedSlot.create(slot_id: slot[:slot_id],
                                        room_id: slot[:room],
                                        name: slot[:name],
                                        email: slot[:email],
                                        on_day: slot[:day],
                                        on_date: slot[:date])

      @slot_booked ? true : false
    end #make_new_booking
      
end
