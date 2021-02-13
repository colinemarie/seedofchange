class ActivitiesController < ApplicationController
  def index
    @clan_id = current_user.clan_id
    @validated_challenges = UserChallenge.includes(:user).where(status: "validated", users: {clan_id: @clan_id})
    @time = Time.zone.now
    activities = current_user.activities
    activities.update(read: true)
    #affiche les 30 derniers challenges du clan
  end
end
