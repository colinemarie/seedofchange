import consumer from "./consumer";

const initNotificationCable = () => {
  const notif = document.getElementById('notif');
  if (notif) {
    const id = notif.dataset.clanId;
    const currentUser = notif.dataset.currentUser;
    consumer.subscriptions.create({ channel: "NotificationChannel", id: id }, {
      received(data) {
      const html = $(data);
      const user = html[0].dataset.user === currentUser;
        if (!user) {
          notif.innerHTML = data
        }
      },
    });
  }
}

export { initNotificationCable };
