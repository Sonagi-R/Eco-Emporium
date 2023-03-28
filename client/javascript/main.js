const productsPerPage = 14;
const productList = document.getElementById('product-list');

const products = productList.querySelectorAll('.product');
const numPages = Math.ceil(products.length / productsPerPage);

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