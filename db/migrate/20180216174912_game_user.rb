class GameUser < ActiveRecord::Migration[5.1]
  def change
    create_table :gameusers do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :role_id
      t.integer :current_role
      t.integer :position

      t.timestamps
    end
  end
end
