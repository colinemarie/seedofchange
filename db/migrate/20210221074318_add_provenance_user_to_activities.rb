class AddProvenanceUserToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :username, :string
  end
end
