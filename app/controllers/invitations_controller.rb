class InvitationsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    @invitation = user.invitation
    @clan = current_user.clan
    if user && user.clan.nil?
      Invitation.create(user: user, clan: current_user.clan)
      flash[:alert] = "Nous  avons envoyé l'invitation"
      redirect_to clan_path current_user.clan
      @invitation.save
    elsif
      user && clan = current_user.clan
      flash[:alert] = "Cette personne est déjà dans votre super clan"
      redirect_to clan_path current_user.clan
    else
      flash[:alert] = "Nous n'avons pas trouvé cette personne"
      redirect_to clan_path current_user.clan
    end
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation.update(status: params[:status])
    if params[:status] == "accepted"
      current_user.clan = @invitation.clan
      current_user.save
    end
    redirect_to clan_path(current_user.clan)
  end
end
