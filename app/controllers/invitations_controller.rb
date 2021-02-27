class InvitationsController < ApplicationController
  def create
    invited_user = User.find_by(username: params[:username])
    clan = current_user.clan
    if invited_user && clan != invited_user.clan
      invitation = Invitation.create(user: invited_user, clan: clan)
      flash[:alert] = "Nous avons envoyé une invitation à #{invited_user.username}."
      invitation.save
    elsif invited_user && clan == invited_user.clan
      flash[:alert] = "#{invited_user.username.capitalize} fait déjà partie du clan #{clan.name.capitalize}"
    else
      flash[:alert] = "Nous n'avons pas trouvé '#{params[:username].capitalize}'."
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
    redirect_to clan_path(current_user.clan, tab: 'ranking')
  end
end
