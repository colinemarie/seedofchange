class UserChallengesController < ApplicationController
  before_action :set_user_challenge, only: [:show, :accept, :decline, :drop, :validate]

  def index
    @user_challenges = UserChallenge.get_user_challenges(current_user, 'accepted')
  end

  def create
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    @undone_challenges = (Challenge.all - current_user.challenges).sample(7 - @user_challenges_ongoing)
    return if @undone_challenges.empty?

    @user_challenges = []
    @undone_challenges.each do |challenge|
      @user_challenges << UserChallenge.create(challenge: challenge, user: current_user, status: 'pending')
    end
    redirect_to user_challenge_path(@user_challenges.first)
  end

  def show
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    @current_week = Date.today.strftime('%d %b %Y')
  end

  def accept
    @user_challenge.update(status: "accepted")
    action_after_update
  end

  def decline
    @user_challenge.update(status: "declined")
    action_after_update
  end

  def drop
    @user_challenge.update(status: "dropped")
    redirect_to user_challenges_path
  end

  def validate
    @user_challenge.update(status: "validated")
    redirect_to user_challenges_path
  end

  private

  def set_user_challenge
    @user_challenge = UserChallenge.find(params[:id])
  end

  def action_after_update
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    @user_challenges_pending = UserChallenge.get_user_challenges(current_user, 'pending')
    if @user_challenges_ongoing >= 5
      @user_challenges_pending.destroy_all
      render "user_challenges/end"
    elsif @user_challenges_pending.empty?
      render "user_challenges/end"
    else
      redirect_to user_challenge_path(@user_challenges_pending.first)
    end
  end
end
