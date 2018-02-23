class Friend < ApplicationRecord
  has_many :friends, -> {where(user_id: self.id)}
end