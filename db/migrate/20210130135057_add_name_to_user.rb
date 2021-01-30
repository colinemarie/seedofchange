class AddNameToUser < ActiveRecord::Migration[6.0]
  def change
   add_column :users, :username, :string
   add_column :users, :first_name, :string
   add_column :users, :score, :integer, default: 0
  end
end
