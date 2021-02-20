class InvitationsController < ApplicationController
  def create
    invited_user = User.find_by(username: params[:username])
    clan = current_user.clan
    if invited_user && clan != invited_user.clan
      invitation = Invitation.create(user: invited_user, clan: clan)
      flash[:alert] = "Nous avons envoyé une invitation à #{invited_user}."
      invitation.save
    elsif invited_user && clan == invited_user.clan
      flash[:alert] = "#{invited_user.capitalize} fait déjà partie du clan #{clan}"
    else
      flash[:alert] = "Nous n'avons pas trouvé '#{user.capitalize}'."
    end
    redirect_to clan_path(current_user.clan)
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
