import consumer from "./consumer";

const initNotificationCable = () => {
  const notif = document.getElementById('notif');
  if (notif) {
    const id = notif.dataset.clanId;
    consumer.subscriptions.create({ channel: "NotificationChannel", id: id }, {
      received(data) {
        notif.innerHTML = data
      },
    });
  }
}

export { initNotificationCable };
