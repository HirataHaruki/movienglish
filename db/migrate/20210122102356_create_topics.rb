class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :level
      t.string :favorite_line

      t.timestamps
    end
  end
end
