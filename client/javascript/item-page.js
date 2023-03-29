const itemImage = document.querySelectorAll(".carousel-image")
const currentImage = document.querySelector(".current-image")
const itemTitle = document.querySelector('.item-title')
const price = document.querySelector('#price')
const description = document.querySelector('#description')
const previous = document.querySelector("#previous")
const next = document.querySelector("#next")
const addToCart = document.querySelector('#add-to-cart')
const carouselImages = document.querySelectorAll('.carousel-image')
const numOfItems = document.querySelector('#numOfItems')
const checkoutButton = document.querySelector('#checkoutButton')
const dropDownContent = document.querySelector('.dropdown-content')
const goToCheckout = document.querySelector('#goToCheckout')

const allSrc = []
let checkOutIncrementer = 0
const idx = 2
const item = []

let checkout;


if (!localStorage.checkout){
  checkout = []
  numOfItems.textContent = `00`
} else {
  checkout = []
  JSON.parse(localStorage.checkout).forEach((item) => {
    checkout.push(item)
  })
  updateCheckoutNum()
  checkout.forEach((item) => {
  createCheckoutItem(item)
  })
}



fetch(`https://localhost:8080/items/${localStorage.item_id}`, { credentials: "include" })
  .then((response) => response.json())
  .then((data) => {
    currentImage.src = `${data.image_url}`
    carouselImages[0].src = `${data.image_url}`
    const additionalImages = data.additional_imgs.split(", ")
    carouselImages[1].src = additionalImages[0]
    carouselImages[2].src = additionalImages[1]
    itemTitle.textContent = `${data.name}`
    price.textContent = `${addDotToPrice(data.price)}`
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
  localStorage.setItem('checkout', JSON.stringify(checkout))
  updateCheckoutNum()
  createCheckoutItem(item[0])
})

checkoutButton.addEventListener('click', () => {
  dropDownContent.classList.toggle('block')
})

goToCheckout.addEventListener('click', () => {
  window.location.href = 'http://localhost:2000/checkout.html'
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
  
function addDotToPrice(priceTally) {
  priceString = priceTally.toString()
  dotPosition = priceString.length - 2
  correctPrice = priceString.slice(0, dotPosition) + '.' + priceString.slice(dotPosition)
  return `£${correctPrice}`
}

function updateCheckoutNum() {
  checkOutIncrementer = eval(JSON.parse(localStorage.checkout)).length
  if (checkOutIncrementer < 0) {
    numOfItems.textContent = ""
  } else if (checkOutIncrementer < 10) {
    numOfItems.textContent = `0${checkOutIncrementer}`
  } else {
    numOfItems.textContent = checkOutIncrementer
  }
}

async function createCheckoutItem(item) {
  const a = document.createElement('a')
  const p = document.createElement('p')
  const button = document.createElement('button')
  const div = document.createElement('div')
  a.textContent = item.name
  p.textContent = addDotToPrice(item.price)
  button.textContent = 'Delete'
  div.appendChild(a)
  div.appendChild(p)
  div.appendChild(button)
  dropDownContent.appendChild(div)
}
