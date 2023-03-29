const itemImage = document.querySelectorAll(".carousel-image")
const currentImage = document.querySelector(".current-image")
const itemTitle = document.querySelector('.item-title')
const price = document.querySelector('#price')
const description = document.querySelector('#description')
const previous = document.querySelector("#previous")
const next = document.querySelector("#next")
const addToCart = document.querySelector('#add-to-cart')
const carouselImages = document.querySelectorAll('.carousel-image')


const allSrc = []
let checkOutIncrementer = 0
const idx = 2
const item = []
const checkout = []

fetch(`https://localhost:8080/items/${localStorage.item_id}`)
  .then((response) => response.json())
  .then((data) => {
    currentImage.src = `${data.image_url}`
    carouselImages[0].src = `${data.image_url}`
    const additionalImages = data.additional_imgs.split(", ")
    carouselImages[1].src = additionalImages[0]
    carouselImages[2].src = additionalImages[1]
    itemTitle.textContent = `${data.name}`
    priceString = data.price.toString()
    dotPosition = priceString.length - 2
    correctPrice = priceString.slice(0,dotPosition) + '.' + priceString.slice(dotPosition)
    price.textContent = `${correctPrice}`
    description.textContent = `${data.description}`
    item.push(data)
  })

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

addToCart.addEventListener('click', () => {
  checkout.push(item[0])
    localStorage.setItem('checkout',JSON.stringify(checkout))
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



