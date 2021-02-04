class ChangeColumnDefaultToUserChallengesTable < ActiveRecord::Migration[6.0]
  def change
    change_column_default :user_challenges, :status, 'pending'
  end
end
