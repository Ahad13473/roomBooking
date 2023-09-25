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
end
