class AddInRoomToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :in_room, :integer, default: -1
  end
end
