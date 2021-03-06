import consumer from "./consumer";

const initNotificationCable = () => {
  const notif = document.getElementById('notif');
  const audio = new Audio(notif.dataset.file);
  if (notif) {
    const id = notif.dataset.clanId;
    const currentUser = notif.dataset.currentUser;
    consumer.subscriptions.create({ channel: "NotificationChannel", id: id }, {
      received(data) {
      const html = $(data);
      const user = html[0].dataset.user === currentUser;
        if (!user) {
          notif.innerHTML = data
          audio.play();
        }
      },
    });
  }
}

export { initNotificationCable };
