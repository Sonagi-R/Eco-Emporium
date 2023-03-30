const itemImage = document.querySelectorAll(".carousel-image");
const sellerUsername = document.querySelector("#seller");
const itemTitle = document.querySelector(".item-title");
const boughtPrice = document.querySelector("#bought-price");
const price = document.querySelector("#price");
const description = document.querySelector("#description");
const previous = document.querySelector("#previous");
const next = document.querySelector("#next");
const tag = document.querySelector("#tag");
const addToCart = document.querySelector("#add-to-cart");
const numOfItems = document.querySelector("#numOfItems");
const checkoutButton = document.querySelector("#checkoutButton");
const dropDownContent = document.querySelector(".dropdown-content");
const goToCheckout = document.querySelector("#goToCheckout");

const allSrc = [];
let checkOutIncrementer = 0;
const idx = 2;
const items = [];

let checkout;

if (!localStorage.checkout) {
  checkout = [];
  numOfItems.textContent = `00`;
} else {
  checkout = [];
  JSON.parse(localStorage.checkout).forEach((item) => {
    checkout.push(item);
  });
  updateCheckoutNum();
  checkout.forEach((item) => {
    createCheckoutItem(item);
  });
}

function createItemElement(data) {
  const img = document.createElement("img");
  img.className = "current-image";
  img.id = "current-image";
  img.src = data.image_url;

  return img;
}

function createCarouselElement(data) {
  const img = document.createElement("img");
  img.className = "carousel-image";
  img.src = data;
  
  return img;
}

let images 
let currentImage 
let currentIndex = 0;
let currentImageList = []

async function loadItem() {
  const response = await fetch(
    `https://localhost:8080/items/${localStorage.item_id}`,
    { credentials: "include" }
  );

  if (response.status == 200) {
    const item = await response.json();

    const userResponse = await fetch(
      `https://localhost:8080/auth/user/${item.user_id}`,
      { credentials: "include" }
    );

    items.push(item)
    console.log(items)
    
    if (userResponse.status == 200) {
      const { user } = await userResponse.json();

      const itemImage = document.querySelector("#item-image");
      const multiCarosel = document.querySelector("#multi-carousel");
  
      const elem = createItemElement(item);
      itemImage.appendChild(elem);
  
      const additionalImages = item.additional_imgs.split(", ");
  
      additionalImages.forEach((a) => {
        const elem = createCarouselElement(a);
        multiCarosel.appendChild(elem);
      });
  
      sellerUsername.textContent = `${user.username}`
      itemTitle.textContent = `${item.name}`;
      boughtPrice.textContent = ` ${addDotToPrice((item.price * 2))}`;
      price.textContent = ` ${addDotToPrice(item.price)}`;
      description.textContent = `${item.description}`;
      tag.innerHTML = `<i class="fa-solid fa-tags fa-xl" style="color: #55c371;" id="tags"></i> Tags: ${item.category}`;

      currentImage = document.querySelector('#current-image');
      images = document.querySelectorAll('.carousel-image');
      currentImageList.push(currentImage.src);
      images.forEach(i => {
        currentImageList.push(i.src);
      });
    }
    else {
      window.location.assign("item-page.html");
    }
  } else {
    window.location.assign("item-page.html");
  }
}

loadItem()

const previousButton = document.querySelector('#previous');
const nextButton = document.querySelector('#next');

function showNextImage() {
  currentIndex = (currentIndex + 1) % currentImageList.length;
  currentImage.src = currentImageList[currentIndex];
}

function showPreviousImage() {
  currentIndex = currentIndex === 0 ? currentImageList.length - 1 : currentIndex - 1;
  currentImage.src = currentImageList[currentIndex];
}

previousButton.addEventListener('click', showPreviousImage);
nextButton.addEventListener('click', showNextImage);

addToCart.addEventListener("click", () => {
  checkout.push(items[0]);
  localStorage.setItem("checkout", JSON.stringify(checkout));
  updateCheckoutNum();
  createCheckoutItem(items[0]);
});

checkoutButton.addEventListener("click", () => {
  dropDownContent.classList.toggle("block");
});

goToCheckout.addEventListener("click", () => {
  window.location.href = "http://localhost:2000/checkout.html";
});

function myFunction() {
  let x = document.getElementById("top-nav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}

function addDotToPrice(priceTally) {
  priceString = priceTally.toString();
  dotPosition = priceString.length - 2;
  correctPrice =
    priceString.slice(0, dotPosition) + "." + priceString.slice(dotPosition);
  return `£${correctPrice}`;
}

function updateCheckoutNum() {
  checkOutIncrementer = eval(JSON.parse(localStorage.checkout)).length;
  if (checkOutIncrementer < 0) {
    numOfItems.textContent = "";
  } else if (checkOutIncrementer < 10) {
    numOfItems.textContent = `0${checkOutIncrementer}`;
  } else {
    numOfItems.textContent = checkOutIncrementer;
  }
}

async function createCheckoutItem(item) {
  const a = document.createElement("a");
  const p = document.createElement("p");
  const button = document.createElement("button");
  const div = document.createElement("div");
  const innerDiv = document.createElement("div");
  a.textContent = item.name;
  p.textContent = addDotToPrice(item.price);
  button.textContent = "Delete";
  innerDiv.className = "inner-div"
  div.appendChild(a);
  innerDiv.appendChild(p);
  innerDiv.appendChild(button);
  div.appendChild(innerDiv)
  dropDownContent.appendChild(div);
}
