const express = require("express");
const cors = require("cors");
const session = require("express-session");
const store = new session.MemoryStore();

const items = require("./routes/item");
const users = require("./routes/user");

const auth = require("./middleware/auth");

const app = express();

app.use(
  cors({
    origin: "http://localhost:2000",
    credentials: true,
  })
);

app.use(express.json());
app.use(
  session({
    secret: process.env.SECRET,
    cookie: { 
      maxAge: 86400000, 
      expires: new Date(Date.now() + 86400000), 
      sameSite: "none", 
      secure: true 
    },
    saveUninitialized: false,
    resave: true,
    store,
  })
);

app.use("/auth", users);
app.use("/items", auth, items);

module.exports = app;

// auth,
