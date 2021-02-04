class AddClanToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :clan, foreign_key: true
  end
end
