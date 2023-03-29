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