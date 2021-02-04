class CreateClans < ActiveRecord::Migration[6.0]
  def change
    create_table :clans do |t|
      t.string :name
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
