"use strict";


const switchButton = document.querySelector(".switch-button");
const switchBtnRight = document.querySelector(".switch-button-case.right");
const switchBtnLeft = document.querySelector(".switch-button-case.left");
const activeSwitch = document.querySelector(".active");


const switchLeft = () => {
  activeSwitch.style.left = "0%";
};

const switchRight = () => {
  activeSwitch.style.left = "50%";
};

const initSwitchButton = () => {
  if (switchButton) {
    switchBtnLeft.addEventListener(
      "click",
      function () {
        switchLeft();
      }
    );

    switchBtnRight.addEventListener(
      "click",
      function () {
        switchRight();
      }
    );
    };
  }
export {initSwitchButton};
