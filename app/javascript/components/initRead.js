const initRead = () => {
  const activity = document.querySelector(".activities");
  if (activity) {
    setTimeout(() => {
      postAsRead(activity)
      markAsRead(activity)
    }, 1000);
  }
}

const postAsRead = (activity) => {
  const id = activity.dataset.userId
  const url = activity.dataset.baseUrl + "activities/read"
  const token = activity.dataset.authToken
  fetch(url, {
    method: "POST",
    headers: {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-Token': token,
    'Content-Type': 'application/json',
            'Accept': 'application/json'
    },
    credentials: 'same-origin',
    body: JSON.stringify({ id: id })
  })
}


const markAsRead = (activity) => {
  const unreads = document.querySelectorAll(".unread");
  unreads.forEach((unread) => {
    unread.classList.remove("unread")
  })
}



export {initRead};
