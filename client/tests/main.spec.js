const renderDOM = require("./helpers.js__")


describe("layout", () => {
    let dom

    beforeEach(async () => {
        dom = await renderDOM("main.html")
    })

    afterEach(() => {
        dom.window.document.body.innerHTML = ""
    })

    describe("button", () => {
        
    })
})