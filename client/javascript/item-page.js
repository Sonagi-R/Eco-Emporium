const itemImage = document.querySelectorAll(".carousel-image")
const currentImage = document.querySelector(".current-image")
const itemTitle = document.querySelector('.item-title')
const price = document.querySelector('#price')
const description = document.querySelector('#description')
const previous = document.querySelector("#previous")
const next = document.querySelector("#next")
const addToCart = document.querySelector('#add-to-cart')


fetch(`https://localhost:8080/items/${localStorage.item_id}`)
  .then((response) => response.json())
  .then((data) => {
    console.log(data)
    currentImage.src = `${data.image_url}`
    itemTitle.textContent = `${data.name}`
    priceString = data.price.toString()
    dotPosition = priceString.length - 2
    correctPrice = priceString.slice(0,dotPosition) + '.' + priceString.slice(dotPosition)
    price.textContent = `${correctPrice}`
    description.textContent = `${data.description}`
  })

const allSrc = []
let checkOutIncrementer = 0
const idx = 2

itemImage.forEach((item) => {
  allSrc.push(item["src"])
})

let incrementor = 0;

currentImage.src = itemImage[incrementor].src
 
previous.addEventListener("click", e => {
  if (incrementor > 0) {
    next.style.display = 'block';
    incrementor -= 1
    currentImage.src = allSrc[incrementor]
  } 
  
  if (incrementor == 0) {
    previous.style.display = 'none';
  }
})

next.addEventListener("click", e => {
  if (incrementor < (itemImage.length -1)) {
    previous.style.display = 'block'
    incrementor += 1
    currentImage.src = allSrc[incrementor]
  }
  
  if (incrementor == (itemImage.length -1)) {
    next.style.display = 'none';
  }
})

addToCart.addEventListener('click', (idx) => {
  checkOutIncrementer += 1
  fetch(`https://localhost:7000/items/2`)
    .then((response) => response.json())
  .then((data) => {
      //save data to localStorage
    localStorage.setItem(data)
    //populate page info with product object from database

    })
  //add new key to object in localstorage set to 1 after click and increment
})

/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
function myFunction() {
    let x = document.getElementById("top-nav");
    if (x.className === "topnav") {
      x.className += " responsive";
    } else {
      x.className = "topnav";
    }
  }



