class Game < ApplicationRecord
  has_many :users

  def get_leader
    User.find_by_id self.leader
  end

  def get_all_player
    gameuser = Gameuser.where game_id: self.id
    User.where id: gameuser.pluck(:user_id)
  end
end