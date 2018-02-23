class RoomsController < ApplicationController
  def index
    @rooms = Game.where state: [0,1]
  end

  def create
    gameuser = Gameuser.new user_id: params[:user_id], game_id: params[:game_id]
    gameuser.save
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
      Gameuser.where(user_id: id, game_id: params[:id]).last.update_attributes role_id: role,
        current_role: role, position: index
    #############

    end
  end
end