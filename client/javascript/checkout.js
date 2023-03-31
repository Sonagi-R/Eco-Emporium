const checkoutList = document.querySelector("#checkoutList");
const totalPrice = document.querySelector("#totalPrice");
const complete = document.querySelector("#complete");

complete.addEventListener("click", () => {
  checkoutData.forEach((checkout) => {
    deleteFromDB(checkout);
    const currentItem = document.querySelector(`#item${checkout.item_id}`);
    currentItem.innerHTML = "";
  });
  localStorage.removeItem("checkout");
  window.location.assign("main.html");
});

let priceTally = 0;

const checkoutData = JSON.parse(localStorage.checkout);

createCheckoutList(checkoutData);

totalPrice.textContent = `${addDotToPrice(priceTally)}`;

function addDotToPrice(priceTally) {
  priceString = priceTally.toString();
  dotPosition = priceString.length - 2;
  correctPrice =
    priceString.slice(0, dotPosition) + "." + priceString.slice(dotPosition);
  return `£${correctPrice}`;
}

async function deleteFromDB(checkoutItem) {
  const response = await fetch(
    `https://localhost:8080/items/${checkoutItem.item_id}`,
    { credentials: "include" }
  );

  if (response.status == 200) {
    const item = await response.json();
    fetch(`https://localhost:8080/items/${item.item_id}`, {
      method: "delete",
      headers: { "Content-Type": "application/json" },
      credentials: "include",
      body: "",
    });
  } else {
    alert(`The item ${checkoutItem.name} is not available for sale`);
  }
}

function createCheckoutList(checkoutInfo) {
  for (let i = 0; i < checkoutInfo.length; i++) {
    const item = document.createElement("div");
    item.setAttribute("id", `item${checkoutInfo[i].item_id}`);
    const itemName = document.createElement("h5");
    const itemPrice = document.createElement("h5");
    itemName.textContent = checkoutInfo[i].name;
    itemPrice.textContent = addDotToPrice(checkoutInfo[i].price);
    priceTally += checkoutInfo[i].price;
    item.appendChild(itemName);
    item.appendChild(itemPrice);
    item.classList.add("item");
    checkoutList.appendChild(item);
  }
}
