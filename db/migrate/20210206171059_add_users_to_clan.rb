class AddUsersToClan < ActiveRecord::Migration[6.0]
  def change
    add_reference :clans, :user, null: false, foreign_key: true
  end
end
