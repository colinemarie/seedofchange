class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @validated_challenges = Challenge.includes(user_challenges: :user).where(user_challenges: {user: current_user, status: "validated"})
    @category_count = @validated_challenges.group(:category).count
  end


end
