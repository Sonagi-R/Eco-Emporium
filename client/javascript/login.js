const signInBtn = document.querySelector("#sign-in-btn")
const signUpBtn = document.querySelector("#sign-up-btn")
const formCover = document.querySelector("#form-cover")
const signInForm = document.querySelector("#sign-in-form")
const signUpForm = document.querySelector("#sign-up-form")

signUpBtn.addEventListener("click", () => {
    formCover.classList.add("active")
    signInForm.reset()
})

signInBtn.addEventListener("click", () => {
    formCover.classList.remove("active")
    signUpForm.reset()
})