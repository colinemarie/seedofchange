class ClansController < ApplicationController
  def show
    @clan = current_user.clan
    @members_by_position = @clan.users.order(score: :desc)
    @invitation = current_user.invitations.where(status: "pending").last
  end
  # def add_user
  #   user = User.find_by(username: params[:username])
  #   @clan = Clan.find(params[:id])
  #   if user && user.clan.nil?
  #     user.clan = @clan
  #     user.save
  #     flash[:alert] = "Nous avons bien ajouté #{user} au clan #{@clan}"
  #   elsif user
  #     flash[:alert] = "#{user.capitalize} fait déjà partie d'un clan"
  #   else
  #     flash[:alert] = "Nous n'avons pas trouvé #{user}. "
  #   end
  #   redirect_to clan_path @clan
  # end
end
