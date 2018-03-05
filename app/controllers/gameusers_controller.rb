class GameroomsController < ApplicationController
  def create
    user = User.find_by_id params[:user_id]
    if user.in_room != -1
      old_room = user.in_room
      old_gameuser = Gameuser.find_by game_id: old_room, user_id: params[:user_id]
      old_gameuser.delete
    end

    gameuser = Gameuser.new user_id: params[:user_id], game_id: params[:game_id]
    user.in_room = params[:game_id] if gameuser.save
    user.save
  end
end
