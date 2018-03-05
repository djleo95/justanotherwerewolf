class Test < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :content, null: false, default: ""
      t.integer :user_id

      t.timestamps
    end
  end
end
