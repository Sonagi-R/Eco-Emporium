const newListingBtn = document.querySelector("#new-listing-btn")
const cancelBtn = document.querySelector("#cancel-btn")
const overlay = document.querySelector("#overlay")
const userUpdateBtn = document.querySelector('#update-submit')
const inputs = document.querySelectorAll('.update-input')

userUpdateBtn.addEventListener('click', () => {
    console.log('clicked')
    amendUser(getUserFormData())
    console.log('request done')
})

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

    const response = await fetch(`https://localhost:8080/items/user/${localStorage.getItem("user_id")}`, { credentials: "include" });
    
    if (response.status == 200) {
        const listings = await response.json();
    
        const container = document.querySelector("#listings-list");

        listings.forEach(p => {
            const elem = createListingElement(p);
            container.appendChild(elem);
        })
    } else {
        window.location.assign("profile.html");
    }
}

 loadListings()


function getUserFormData() {
    const userFormData = {};
    inputs.forEach((input) => (userFormData[input.name] = input.value));
    return userFormData;
  }

const amendUser = async (data) => {
    const options = {
        method: "PATCH",
        credentials: "include",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
    }

    console.log(options.body)
  console.log(localStorage.user_id)
    const res = await fetch(`https://localhost:8080/auth/user/${localStorage.user_id}`, options);
  
    console.log(await res.json())

    if (res.ok) {
        console.log('updated user')
    //   window.location.assign("main.html");
    } else {
      console.log("Something failed, very sad! :(");
    }
}