class NotificationChannel < ApplicationCable::Channel
  def subscribed
    clan = Clan.find(params[:id])
    stream_for clan
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
