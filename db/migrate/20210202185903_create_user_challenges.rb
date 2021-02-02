class CreateUserChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :user_challenges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.string :status
      t.boolean :saved, default: false
      t.datetime :starts_at

      t.timestamps
    end
  end
end
