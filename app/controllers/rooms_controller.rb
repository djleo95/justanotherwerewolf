class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_in_room, only: :show

  def index
    get_all_room
  end

  def create
    @new_room = Game.new
    @new_room.update_attributes capacity: params[:capacity], has_pass: params[:has_pass],
      password: params[:password], leader: current_user.id
    get_all_room

    respond_to do |f|
      f.html
      f.json
    end
  end

  def show
    @room = Game.find_by_id params[:id]
  end

  def update
    # random role & save to *gameusers table
    roleArray = params[:card]
    userArray = Gameuser.where(game_id: params[:id]).pluck :user_id
    userArray.each_with_index  do |id, index|
      role = roleArray[rand(roleArray.length)]
      roleArray.delete(role)
      Gameuser.find_by(user_id: id, game_id: params[:id]).update_attributes role_id: role,
        current_role: role, position: index
    end
    start_game
  end

  def role_calling
    game = Game.find_by_id current_user.in_room
    round = 0

    message = Rounduser.new game_id: game.id, user_id: current_user.id,
      round_id: round, choose1: params[:choose1], choose2: params[:choose2]
    if message.save
      ActionCable.server.broadcast "room_#{game.id}",
        game_id: message.game_id,
        user: message.user.nickname,
        round: message.round_id,
        choose1: params[:choose1],
        choose2: params[:choose2]
      head :ok
    end
  end

  private
  def get_all_room
    @rooms = Game.where state: [0,1]
  end


  # def create_message
  #   game = Game.find_by_id current_user.in_room
  #   round = game.current_round
  #
  #   message = Rounduser.new game_id: game.id, user_id: current_user.id,
  #                           round_id: round, choose1: params[:choose1], choose2: params[:choose2]
  #   if message.save
  #     ActionCable.server.broadcast "room_#{game.id}",
  #                                  game_id: message.game_id,
  #                                  user: message.user.nickname,
  #                                  round: message.round_id,
  #                                  choose1: params[:choose1]
  #     head :ok
  #   end
  # end
  #
  def start_game
    game = Game.find_by_id current_user.in_room

    message = Rounduser.new game_id: game.id, user_id: current_user.id, round_id: -1
    if message.save
      ActionCable.server.broadcast "room_#{game.id}",
        game_id: message.game_id,
        user: message.user.nickname,
        round: message.round_id
      head :ok
    end
  end

  def check_in_room
    same_room = true
    if current_user.in_room != -1
      old_room = current_user.in_room
      old_gameuser = Gameuser.find_by game_id: old_room, user_id: current_user.id
      if old_gameuser.present? && old_room.to_s != params[:id]
        old_gameuser.delete
        same_room = false
      end
    end

    if !same_room || !old_gameuser
      gameuser = Gameuser.new user_id: current_user.id, game_id: params[:id]
      current_user.in_room = params[:id] if gameuser.save
      current_user.save
    end
  end
end