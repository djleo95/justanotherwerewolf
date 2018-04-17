class Gameuser < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def get_role_title
    card = Card.find_by_id self.role_id
    card.title
  end
end
