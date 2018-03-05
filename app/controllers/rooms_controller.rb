class RoomsController < ApplicationController
  def index
    @rooms = Game.where state: [0,1]
  end

  def create
    @new_room = Game.new
  end

  def show
    @room = Game.find_by_id params[:id]
  end

  def update
    # random role & save to *gameusers table
    myArray = params[:card]
    userArray = Gameuser.where(game_id: params[:id]).pluck :user_id
    userArray.each_with_index  do |id, index|
      role = myArray[rand(myArray.length)]
      myArray.delete(role)
      Gameuser.find_by(user_id: id, game_id: params[:id]).update_attributes role_id: role,
        current_role: role, position: index
    #############

    end

    respond_to do |f|
      f.html
      f.json
    end
  end

  def create_message
    game = Game.find_by_id current_user.in_room
    round = game.current_round

    message = Rounduser.new game_id: game.id, user_id: current_user.id,
      round_id: round, choose1: params[:choose1], choose2: params[:choose2]
    if message.save
      ActionCable.server.broadcast "room_#{game.id}",
        game_id: message.game_id,
        user: message.user.nickname,
        round: message.round_id,
        choose1: params[:choose1]
      head :ok
    end
  end
end