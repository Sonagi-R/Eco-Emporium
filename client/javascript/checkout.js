const article = document.querySelector('#checkoutList')

const checkoutData = JSON.parse(localStorage.checkout)

for (let i = 0; i < checkoutData.length; i++){
    const item = document.createElement('div')
    const itemName = document.createElement('h5')
    const itemPrice = document.createElement('h5')
    itemName.textContent = checkoutData[i].name
    itemPrice.textContent = checkoutData[i].price
    item.appendChild(itemName)
    item.appendChild(itemPrice)
    item.classList.add('item')
    article.appendChild(item)
}