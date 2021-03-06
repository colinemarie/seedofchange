class UserChallengesController < ApplicationController
  before_action :set_user_challenge, only: [:show, :accept, :decline, :drop, :validate]

  def index
    @user_challenges = UserChallenge.get_user_challenges(current_user, 'accepted')
  end

  def create
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    @undone_challenges = (Challenge.all - current_user.challenges).first(7 - @user_challenges_ongoing)
    if @undone_challenges.empty?
      flash[:alert] = "Tu as réalisé tous les challenges de Seed of Change, félications !"
      redirect_to user_challenges_path
    else
      @user_challenges = @undone_challenges.map { |challenge| UserChallenge.create(challenge: challenge, user: current_user, status: 'pending')}
      redirect_to user_challenge_path(@user_challenges.first)
    end
  end

  def show
    @disable_bell = true
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    @current_week = Date.today.strftime('%d %b %Y')
    @already_users = User.includes(:user_challenges).where(clan: current_user.clan, user_challenges: { status: 'validated', challenge: @user_challenge.challenge })
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
    clan_notification if current_user.clan
    @validated_challenges = Challenge.includes(user_challenges: :user).where(category: @user_challenge.challenge.category, user_challenges: { user: current_user, status: "validated" })
    @category_count = @validated_challenges.count
    if @category_count == 6 || @category_count == 11 || @category_count == 16
      redirect_to user_challenges_path, notice: "Bravo, tu as gagné #{@user_challenge.challenge.difficulty * 50} points 🥳 et un badge #{@user_challenge.challenge.category} 🏆 !"
    else
      redirect_to user_challenges_path, notice: "Bravo, tu as gagné #{@user_challenge.challenge.difficulty * 50} points ! 🥳🥳🥳 "
    end
  end

  private

  def clan_notification
    other_users = current_user.clan.users.excluding(current_user)
    broadcast_notification
    other_users.each { |user| Activity.create(user: user, user_challenge: @user_challenge) }
    return unless check_position_change == true

    Activity.create(user: @higher_user, user_challenge: @user_challenge, username: current_user.username)
  end

  def broadcast_notification
    NotificationChannel.broadcast_to(
      current_user.clan,
      render_to_string(partial: "shared/notifications", locals: { status: true, user: @user_challenge.user })
    )
  end

  def check_position_change
    users = current_user.clan.users.order(score: :desc)
    user_position = users.index(current_user)
    return if user_position.zero?

    @higher_user = users[user_position - 1]
    higher_score = @higher_user.score
    updated_score = (@user_challenge.challenge.difficulty * 50) + current_user.score
    updated_score > higher_score
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
