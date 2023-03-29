const article = document.querySelector('#checkoutList')
const totalPrice = document.querySelector('#totalPrice')
let priceTally = 0

const checkoutData = JSON.parse(localStorage.checkout)

for (let i = 0; i < checkoutData.length; i++){
    const item = document.createElement('div')
    const itemName = document.createElement('h5')
    const itemPrice = document.createElement('h5')
    itemName.textContent = checkoutData[i].name
    itemPrice.textContent = addDotToPrice(checkoutData[i].price)
    priceTally += checkoutData[i].price
    item.appendChild(itemName)
    item.appendChild(itemPrice)
    item.classList.add('item')
    article.appendChild(item)
}

function addDotToPrice(priceTally) {
    priceString = priceTally.toString()
    dotPosition = priceString.length - 2
    correctPrice = priceString.slice(0, dotPosition) + '.' + priceString.slice(dotPosition)
    return `£${correctPrice}`
}

totalPrice.textContent = `${addDotToPrice(priceTally)}`