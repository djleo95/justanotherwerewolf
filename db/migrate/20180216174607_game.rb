class Game < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :room_id
      t.integer :current_round
      t.integer :number_of_player, default: 0

      t.timestamps
    end
  end
end
