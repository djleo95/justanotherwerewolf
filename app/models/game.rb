class Game < ApplicationRecord
  has_many :users

  def get_leader
    User.find_by_id self.leader
  end
end