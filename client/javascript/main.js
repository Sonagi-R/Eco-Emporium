const newListingBtn = document.querySelector("#new-listing-btn")
const cancelBtn = document.querySelector("#cancel-btn")
const overlay = document.querySelector("#overlay")

const productsPerPage = 14;
const productList = document.getElementById('product-list');

const products = productList.querySelectorAll('.product');
const productImages = document.querySelectorAll('.productImage')
const productNames = document.querySelectorAll('.productName')
const productPrice = document.querySelectorAll('.productPrice')
const numPages = Math.ceil(products.length / productsPerPage);

const allItems = document.querySelectorAll('#all-items')
const categories = document.querySelectorAll('.categories')

const paginationContainer = document.getElementById('pagination');
for (let i = 1; i <= numPages; i++) {
  const link = document.createElement('a');
  link.href = '#';
  link.innerText = i;
  link.addEventListener('click', (event) => {
    event.preventDefault();
    showPage(i);
  });
  paginationContainer.appendChild(link);
}

function showPage(pageNumber) {
  const startIndex = (pageNumber - 1) * productsPerPage;
  const endIndex = Math.min(startIndex + productsPerPage, products.length);

  products.forEach((product, index) => {
    if (index >= startIndex && index < endIndex) {
      product.style.display = '';
    } else {
      product.style.display = 'none';
    }
  });

  const links = paginationContainer.querySelectorAll('a');
  links.forEach((link, index) => {
    if (index + 1 === pageNumber) {
      link.classList.add('active');
    } else {
      link.classList.remove('active');
    }
  });
}

showPage(1);

let pageData = []

function createProductElement(data) {

  const product = document.createElement("div");
  product.className = "product";
  
  const img = document.createElement("img")
  img.src = data.image_url
  img.className = "productImage"
  product.appendChild(img)

  const productPrice = document.createElement("p")
  productPrice.className = "productPrice"
  productPrice.textContent = addDotToPrice(data.price)
  product.appendChild(productPrice)
  
  const productName = document.createElement("p")
  productName.className = "productName"
  productName.textContent = data.name
  product.appendChild(productName)

  return product;
}

function addDotToPrice(priceTally) {
  priceString = priceTally.toString();
  dotPosition = priceString.length - 2;
  correctPrice = priceString.slice(0, dotPosition) + "." + priceString.slice(dotPosition);
  return `£${correctPrice}`;
}

async function loadListings () {

  const response = await fetch(`https://localhost:8080/items`, { credentials: "include" });
  
  if (response.status == 200) {
      const products = await response.json();
  
      const container = document.querySelector("#product-list");
      container.innerHTML = ""

      products.forEach(p => {
          const elem = createProductElement(p);
          container.appendChild(elem);
          elem.addEventListener("click", () => {
            localStorage.setItem("item_id", p.item_id)
            window.location.assign("item-page.html");
          })
          pageData.push(p)
      })

  } else {
      window.location.assign("main.html");
  }
}

loadListings()

allItems.forEach((allItem) => {
  allItem.addEventListener('click', () => {
    pageData = []
    loadListings()
  })
})


categories.forEach((category) => {
  category.addEventListener('click', () => {
    const currentData = pageData.filter(item => (item.category == `${category.textContent}`))
    const container = document.querySelector("#product-list");
    container.innerHTML = ""

    currentData.forEach(p => {
      const elem = createProductElement(p);
      container.appendChild(elem);
    })
  })
})

newListingBtn.addEventListener("click", () => {
  overlay.style.display = "block";
})

cancelBtn.addEventListener("click", (e) => {
  e.preventDefault()
  overlay.style.display = "none";
})