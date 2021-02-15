class ActivitiesController < ApplicationController
  def index
    @clan_id = current_user.clan_id
    @clan_validated_user_challenges = UserChallenge.includes(:user).where(status: "validated", users: { clan_id: @clan_id }).order(updated_at: :desc)
    @user_challenges_except_user = @clan_validated_user_challenges.excluding(UserChallenge.where(user: current_user))
    @time = Time.zone.now
    activities = current_user.activities
    activities.update(read: true)
  end
end
