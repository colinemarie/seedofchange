class RemoveUserFromClan < ActiveRecord::Migration[6.0]
  def change
    remove_column :clans, :user_id
  end
end
