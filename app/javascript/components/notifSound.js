const validateButton = document.getElementById("validate-btn");
const audio = new Audio('notif.mp3');

const notifSound = () => {
  validateButton.addEventListener("click", (event) => {
    audio.play();
  });
}
export {notifSound};
