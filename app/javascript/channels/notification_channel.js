import consumer from "./consumer";

const initNotificationCable = () => {
  const bell = document.getElementById('bell');
  if (bell) {
    const id = bell.dataset.clanId;
    consumer.subscriptions.create({ channel: "NotificationChannel", id: id }, {
      received(data) {
        bell.innerHTML = data
      },
    });
  }
}

export { initNotificationCable };
