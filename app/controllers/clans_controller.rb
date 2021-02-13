class ClansController < ApplicationController
  def show
    @clan = current_user.clan
    @members_by_position = @clan.users.order(score: :desc)
  end

  def add_user
    user = User.find_by(username: params[:username])
    @clan = Clan.find(params[:id])
    if user && user.clan.nil?
      user.clan = @clan
      user.save
      flash[:alert] = "Nous l'avons bien ajouté à votre clan"
      redirect_to clan_path @clan
    elsif user
      flash[:alert] = "Cette personne est déjà dans un clan"
      redirect_to clan_path @clan
    else
      flash[:alert] = "Nous n'avons pas trouvé cette personne"
      redirect_to clan_path @clan
    end
  end
end
