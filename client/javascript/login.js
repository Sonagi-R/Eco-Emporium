const signInBtn = document.querySelector("#sign-in-btn")
const signUpBtn = document.querySelector("#sign-up-btn")
const formCover = document.querySelector("#form-cover")

signUpBtn.addEventListener("click", () => {
    formCover.classList.add("active")
})

signInBtn.addEventListener("click", () => {
    formCover.classList.remove("active")
})