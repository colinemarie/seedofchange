class ActivitiesController < ApplicationController
  def index
    # @clan_id = current_user.clan_id
    # @clan_validated_user_challenges = UserChallenge.includes(:user).where(status: "validated", users: { clan_id: @clan_id }).order(updated_at: :desc)
    # @user_challenges_except_user = @clan_validated_user_challenges.excluding(UserChallenge.where(user: current_user))
    @activities = current_user.activities.order(updated_at: :desc)
    # @user_challenges = []
    # @activities.each do |activity|
    #   @user_challenges << activity.user_challenge
    # end
  end

  def read
    User.find(params[:id]).activities.update_all(read: true)
    head :no_content
  end
end
