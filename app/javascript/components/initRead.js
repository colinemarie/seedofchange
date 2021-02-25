

  const initRead = () => {
    if (document.querySelector(".activities")) {
    const activity = document.querySelector(".activities");
      setTimeout(() => {
        postAsRead(activity)
        markAsRead(activity)
      }, 2500);
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
    const circle = document.querySelector(".fa-circle");
    unreads.forEach((unread) => {
      unread.classList.remove("unread")
    });
    circle.classList.remove("fa-circle");
  }





export {initRead};
