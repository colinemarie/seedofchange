class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]
  def home
    @user_challenges = UserChallenge.get_user_challenges(current_user, 'accepted')
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    @invitation = current_user.invitations.where(status: "pending").last
  end
end
