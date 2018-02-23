class AddPassToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :has_pass, :boolean, default: false
    add_column :games, :password, :string
  end
end
