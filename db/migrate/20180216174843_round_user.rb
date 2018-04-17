class RoundUser < ActiveRecord::Migration[5.1]
  def change
    create_table :roundusers do |t|
      t.integer :round_id
      t.integer :role_id
      t.integer :user_id
      t.integer :game_id
      t.integer :choose1
      t.integer :choose2

      t.timestamps
    end
  end
end
