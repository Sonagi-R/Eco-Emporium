const itemImage = document.querySelectorAll(".carousel-image")
const currentImage = document.querySelector(".current-image")
const previous = document.querySelector("#previous")
const next = document.querySelector("#next")

const allSrc = []

itemImage.forEach((item) => {
  allSrc.push(item["src"])
})

let incrementor = 0;

currentImage.src = itemImage[incrementor].src
 
previous.addEventListener("click", e => {
  incrementor -= 1
  currentImage.src = allSrc[incrementor];
})

next.addEventListener("click", e => {
  incrementor += 1  
  currentImage.src = allSrc[incrementor];
})


/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
// function myFunction() {
//     let x = document.getElementById("top-nav");
//     if (x.className === "topnav") {
//       x.className += " responsive";
//     } else {
//       x.className = "topnav";
//     }
//   }



