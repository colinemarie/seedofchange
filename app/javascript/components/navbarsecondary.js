"use strict";


const switchButton = document.querySelector(".switch-button");
const switchBtnRight = document.querySelector(".switch-button-case.right");
const switchBtnLeft = document.querySelector(".switch-button-case.left");
const activeSwitch = document.querySelector(".active");


const switchLeft = () => {
  switchBtnRight.classList.remove("active-case");
  switchBtnLeft.classList.add("active-case");
  activeSwitch.style.left = "0%";
};

const switchRight = () => {
  switchBtnRight.classList.add("active-case");
  switchBtnLeft.classList.remove("active-case");
  activeSwitch.style.left = "50%";
};

const initSwitchButton = () => {

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

export {initSwitchButton};


// Usefull code for tab : https://getbootstrap.com/docs/4.0/components/navs/#tabs
