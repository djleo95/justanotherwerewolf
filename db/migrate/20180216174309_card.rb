class Card < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :title, null: false, default: ""
      t.string :description
      t.string :tip_and_trick
      t.integer :side, default: 0

      t.timestamps
    end
  end
end
