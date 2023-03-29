const username = document.querySelector("#username")

const productsPerPage = 14;
const productList = document.getElementById('product-list');

const products = productList.querySelectorAll('.product');
const productImages = document.querySelectorAll('.productImage')
const productNames = document.querySelectorAll('.productName')
const productPrice = document.querySelectorAll('.productPrice')
const numPages = Math.ceil(products.length / productsPerPage);

const allItems = document.querySelector('#all-items')
const categories = document.querySelectorAll('.categories')

const user = JSON.parse(localStorage.getItem("user"))

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

username.innerHTML = user + `<i class="fa-solid fa-user"></i>`
showPage(1);

const pageData = []

fetch(`https://localhost:8080/items`, { credentials: "include" })
    .then((response) => response.json())
    .then((data) => {
      for (let i = 0; i < 10; i++) {
        productImages[i].src = `${data[i].image_url}`
        productNames[i].textContent = `${data[i].name}`
        products[i].setAttribute('id', `${data[i].item_id}`)
        priceString = data[i].price.toString()
        dotPosition = priceString.length - 2
        correctPrice = priceString.slice(0, dotPosition) + '.' + priceString.slice(dotPosition)
        productPrice[i].textContent = `${correctPrice}`
        pageData.push(data[i])
      }
      console.log(data)
      return data
    })
  .catch(err => console.log(err))

for (let i = 0; i < products.length; i++){
  products[i].addEventListener('click', () => {
    localStorage.setItem("item_id",products[i].id)
    window.location = 'http://localhost:2000/item-page.html';
  })
}

allItems.addEventListener('click', () => {
  for (let i = 0; i < 10; i++) {
    productImages[i].src = `${pageData[i].image_url}`
    productNames[i].textContent = `${pageData[i].name}`
    products[i].setAttribute('id', `${pageData[i].item_id}`)
    priceString = pageData[i].price.toString()
    dotPosition = priceString.length - 2
    correctPrice = priceString.slice(0, dotPosition) + '.' + priceString.slice(dotPosition)
    productPrice[i].textContent = `${correctPrice}`
  }
})

categories.forEach((category) => {
  category.addEventListener('click', () => {
    const currentData = pageData.filter(item => (item.category == `${category.textContent}`))
    for (let i = 0; i < currentData.length; i++) {
      productImages[i].src = `${currentData[i].image_url}`
      productNames[i].textContent = `${currentData[i].name}`
      products[i].setAttribute('id', `${currentData[i].item_id}`)
      priceString = currentData[i].price.toString()
      dotPosition = priceString.length - 2
      correctPrice = priceString.slice(0, dotPosition) + '.' + priceString.slice(dotPosition)
      productPrice[i].textContent = `${correctPrice}`
    }
  } )
})
