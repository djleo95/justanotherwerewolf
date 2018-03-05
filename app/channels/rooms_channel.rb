class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params[:game_id]}"
  end
end