const cardsChallenge = document.querySelectorAll(".card-challenge");


const animateBadges =() => {
  if (document.querySelector("#users-show")) {


  cardsChallenge.forEach((challenge) => {
    const challengeProgress = challenge.querySelector(".progression-bar > progress").value;
    const challengeBadges = challenge.querySelectorAll('[id^="badges_"]');
    const challengeLevel = challenge.querySelector('.badges').dataset.level;

    switch (challengeLevel) {
      case "2":
        challengeBadges[0].classList.add("badge-gold");
      break;
      case "3":
        challengeBadges[0].classList.add("badge-gold");
        challengeBadges[1].classList.add("badge-gold");
        console.log('level 3');
      break;
      case "4":
        challengeBadges[0].classList.add("badge-gold");
        challengeBadges[1].classList.add("badge-gold");
        challengeBadges[2].classList.add("badge-gold");
        console.log('level 4');
      break;

    }


  })

  }

}

export {animateBadges};


