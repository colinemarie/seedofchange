class AddNewUserToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :new_user, :string
  end
end
