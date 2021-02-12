class ClansController < ApplicationController
  def show
    @clan = current_user.clan
    @members_by_position = @clan.users.order(score: :desc)
    @score = @clan.users.sum(&:score)
  end
end
