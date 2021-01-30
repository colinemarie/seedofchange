class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :difficulty
      t.integer :duration
      t.integer :price
      t.text :necessary_items
      t.text :how_to
      t.text :tips
      t.text :where_to

      t.timestamps
    end
  end
end
