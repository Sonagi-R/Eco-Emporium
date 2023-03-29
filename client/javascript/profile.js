const username = document.querySelector("#username")
const newListingBtn = document.querySelector("#new-listing-btn")
const cancelBtn = document.querySelector("#cancel-btn")
const overlay = document.querySelector("#overlay")

const user = JSON.parse(localStorage.getItem("user"))

username.innerHTML = user + `<i class="fa-solid fa-user"></i>`

newListingBtn.addEventListener("click", () => {
    overlay.style.display = "block";
})

cancelBtn.addEventListener("click", (e) => {
    e.preventDefault()
    overlay.style.display = "none";
})

function createListingElement (data) {
    
    const listing = document.createElement("div");
    listing.className = "listings";
    
    const img = document.createElement("img")
    img.src = data.image_url
    listing.appendChild(img)

    const listingInfo = document.createElement("div");
    listingInfo.className = "listing-info";
    
    const itemName = document.createElement("p")
    itemName.className = "item-info"
    itemName.textContent = data.name
    listingInfo.appendChild(itemName)
    
    const itemDesc = document.createElement("p")
    itemDesc.className = "item-info"
    itemDesc.textContent = data.description
    listingInfo.appendChild(itemDesc)
    
    const itemPrice = document.createElement("p")
    itemPrice.className = "item-info"
    priceString = data.price.toString()
    dotPosition = priceString.length - 2
    correctPrice = `£${priceString.slice(0,dotPosition) + '.' + priceString.slice(dotPosition)}`
    itemPrice.textContent = correctPrice
    listingInfo.appendChild(itemPrice)

    const button = document.createElement("button")
    button.textContent = "Delete listing"
    listingInfo.appendChild(button)

    listing.appendChild(listingInfo)

    return listing;
}

async function loadListings () {

    console.log(localStorage.getItem("user_id"))

    const response = await fetch(`https://localhost:8080/items/user/${localStorage.getItem("user_id")}`, { credentials: "include" });
    
    if (response.status == 200) {
        const listings = await response.json();
    
        const container = document.querySelector("#listings-list");

        listings.forEach(p => {
            const elem = createListingElement(p);
            container.appendChild(elem);
        })
    } else {
        //window.location.assign("profile.html");
    }
}

loadListings()