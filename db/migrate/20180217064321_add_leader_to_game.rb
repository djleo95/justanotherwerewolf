class AddLeaderToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :leader, :integer
  end
end
