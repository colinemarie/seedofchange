class AddUserChallengeToActivities < ActiveRecord::Migration[6.0]
  def change
    add_reference :activities, :user_challenge, foreign_key: true
  end
end
