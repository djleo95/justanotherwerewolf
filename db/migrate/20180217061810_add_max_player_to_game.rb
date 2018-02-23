class AddMaxPlayerToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :capacity, :integer, default: 10
  end
end
