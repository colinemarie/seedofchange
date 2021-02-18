class UserChallengesController < ApplicationController
  before_action :set_user_challenge, only: [:show, :accept, :decline, :drop, :validate]

  def index
    @user_challenges = UserChallenge.get_user_challenges(current_user, 'accepted')
  end

  def create
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    @undone_challenges = (Challenge.all - current_user.challenges).sample(7 - @user_challenges_ongoing)
    if @undone_challenges.empty?
      flash[:alert] = "Vous avez réalisé tous les challenges, bravo chef !"
      redirect_to user_challenges_path
    else
      @user_challenges = []
      @undone_challenges.each do |challenge|
        @user_challenges << UserChallenge.create(challenge: challenge, user: current_user, status: 'pending')
      end
      redirect_to user_challenge_path(@user_challenges.first)
    end
  end

  def show
    @disable_bell = true
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
    broadcast_notification
    other_users = current_user.clan.users.excluding(current_user)
    other_users.each do |user|
      Activity.create(user: user)
    end
    redirect_to user_challenges_path, notice: "Bravo tu as gagné #{@user_challenge.challenge.difficulty * 50} points"
  end

  private

  def broadcast_notification
    NotificationChannel.broadcast_to(
      current_user.clan,
      render_to_string(partial: "shared/notifications", locals: { status: true, user: @user_challenge.user })
    )
  end

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
