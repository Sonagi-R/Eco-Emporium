const renderDOM = require("./helpers.js__")


describe("layout", () => {
    let dom

    beforeEach(async () => {
        dom = await renderDOM("login.html")
    })

    afterEach(() => {
        dom.window.document.body.innerHTML = ""
    })

    describe("button", () => {
        it("Should show sign up form", () => {
            const btn = dom.window.document.querySelector("#sign-up-btn")
            const signUpForm = dom.window.document.querySelector(".sign-up-form")

            btn.dispatchEvent(new dom.window.MouseEvent("click"))

            expect(signUpForm.parentNode.classList.contains("active")).toBe(true)
        })

        it("Should show sign in form", () => {
            const btn = dom.window.document.querySelector("#sign-in-btn")
            const signInForm = dom.window.document.querySelector(".sign-in-form")

            btn.dispatchEvent(new dom.window.MouseEvent("click"))

            expect(signInForm.parentNode.classList.contains("active")).toBe(false)
        })
    })
})