module UserHelper
  def user_left_room user
    gameuser = Gameuser.where user_id: user.id
    gameuser.each.delete if gameuser.present?
    user.in_room = -1
  end
end