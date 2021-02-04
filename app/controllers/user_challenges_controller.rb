class UserChallengesController < ApplicationController
  before_action :set_user_challenge, only: [:show, :accept, :decline, :drop]
  before_action :set_challenge, only: [:validate]
  def index
    @user_challenges = UserChallenge.all.where({ user: current_user, status: ["accepted"] })
  end

  def create
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    @used_challenges_id = UserChallenge.all.where(user: current_user).map(&:challenge_id)
    @challenges = Challenge.all.where.not(id: @used_challenges_id).sample(7 - @user_challenges_ongoing)
    @user_challenges = []
    @challenges.each do |challenge|
      @user_challenges << UserChallenge.create(challenge: challenge, user: current_user, status: 'pending')
    end
    redirect_to user_challenge_path(@user_challenges.first)
    # @user_challenge = UserChallenge.new
    # @user_challenge.user = current_user
    # @user_challenge.challenge = @challenge
    # @user_challenge.save
  end

  def show
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    @current_week = Date.today.strftime('%d %b %Y')
  end


  def accept
    @user_challenge.update(status: "accepted")
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    if UserChallenge.find_by_id(@user_challenge.id + 1) && @user_challenges_ongoing < 5
      redirect_to user_challenge_path(UserChallenge.find_by_id(@user_challenge.id + 1))
    else
      render "user_challenges/end"
    end
  end

  def decline
    @user_challenge.update(status: "declined")
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    if UserChallenge.find_by_id(@user_challenge.id + 1) && @user_challenges_ongoing < 5
      redirect_to user_challenge_path(UserChallenge.find_by_id(@user_challenge.id + 1))
    else
      render "user_challenges/end"
    end
  end

  def drop
    @user_challenge.update(status: "dropped")
    redirect_to user_challenges_path
  end

  def validate
    @user_challenge = UserChallenge.where(challenge: @challenge)
    @user_challenge.update(status: "validated")
    redirect_to user_challenges_path
  end

  private

  def set_user_challenge
    @user_challenge = UserChallenge.find(params[:id])
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
