module UserHelper
  def user_left_room user
    gameuser = Gameuser.find_by game_id: user.in_room, user_id: user.id
    gameuser.delete
  end
end