const username = document.querySelector("#username")
const user = JSON.parse(localStorage.getItem("user"))

username.innerHTML = user + `<i class="fa-solid fa-user"></i>`