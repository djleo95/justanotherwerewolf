class AddColumnToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :state, :integer
  end
end
