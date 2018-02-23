class Card < ApplicationRecord

  scope :get_villager_side_card, -> {where side: 0}
  scope :get_werewolf_side_card, -> {where side: 1}
  scope :get_neutral_side_card, -> {where side: 2}
end