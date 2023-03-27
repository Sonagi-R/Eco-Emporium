const app = require("./app");
const port = 7000;

app.listen(port, () => {
    console.log(`API listening on port ${port}.`);
});