class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :category
      t.string :description
      t.integer :difficulty
      t.integer :duration
      t.integer :price
      t.string :necessary_items
      t.string :how_to
      t.string :tips
      t.string :where_to

      t.timestamps
    end
  end
end
