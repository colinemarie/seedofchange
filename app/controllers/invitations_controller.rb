class InvitationsController < ApplicationController
  def create
    invited_user = User.find_by(username: params[:username])
    clan = current_user.clan
    if invited_user && clan != invited_user.clan
      invitation = Invitation.create(user: invited_user, clan: clan)
      flash[:alert] = "Nous  avons envoyé l'invitation"
      invitation.save
    elsif invited_user && clan == invited_user.clan
      flash[:alert] = "Cette personne est déjà dans votre super clan"
    else
      flash[:alert] = "Nous n'avons pas trouvé cette personne"
    end
    redirect_to clan_path(current_user.clan)
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation.update(status: params[:status])
    if params[:status] == "accepted"
      current_user.clan = @invitation.clan
      current_user.save
      clan_users = current_user.clan.users.excluding(current_user)
      clan_users.each do |user|
        Activity.create(user: user, new_user: current_user.first_name)
      end
    end
    redirect_to clan_path(current_user.clan)
  end
end
