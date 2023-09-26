# spec/controllers/room_controller_spec.rb

require 'rails_helper'

RSpec.describe RoomController, type: :controller do
  describe 'POST #search_room' do
    it 'responds with turbo stream update' do
      post :search_room, params: { room: { select_a_date: '2023-09-25' } }, format: :turbo_stream
      expect(response).to have_http_status(:success)
      expect(response).to render_template('room/show_all_rooms')
      # Add more expectations as needed
    end
  end

  describe 'POST #room_slots' do
    it 'responds with turbo stream append' do
      room = create(:room) # Assuming you have FactoryBot set up
      post :room_slots, params: { room: { name: room.name, day: 'Monday', date: '2023-09-26' } }, format: :turbo_stream
      expect(response).to have_http_status(:success)
      expect(response).to render_template('room/show_room_slots')
      # Add more expectations as needed
    end
  end

  describe 'POST #make_booking' do
    context 'when slot is available' do
      it 'responds with success message' do
        allow(controller).to receive(:find_already_booked?).and_return(true)
        post :make_booking, params: { slot: { slot_id: 1, room: 1, name: 'John Doe', email: 'john@example.com', day: 'Monday', date: '2023-09-27' } }, format: :turbo_stream
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Booking Saved Successfully!')
        # Add more expectations as needed
      end
    end

    context 'when slot is not available' do
      it 'responds with error message' do
        allow(controller).to receive(:find_already_booked?).and_return(false)
        post :make_booking, params: { slot: { slot_id: 1, room: 1, name: 'John Doe', email: 'john@example.com', day: 'Monday', date: '2023-09-27' } }, format: :turbo_stream
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Already Booked Choose other')
        # Add more expectations as needed
      end
    end
  end
end
