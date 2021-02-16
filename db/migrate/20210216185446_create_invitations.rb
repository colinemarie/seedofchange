class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :clan, null: false, foreign_key: true
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
