const express = require('express')
const cors = require('cors')
const session = require("express-session");
const store = new session.MemoryStore()

const items = require('./routes/item')
const users = require('./routes/user')

const auth = require('./middleware/auth');

const app = express()

app.use(cors())
app.use(express.json())
app.use(
    session({
      secret: process.env.SECRET,
      cookie: { maxAge: 30000 },
      saveUninitialized: false,
      resave: false,
      store
    })
  );

app.use("/auth", users);
app.use('/items', auth, items)

module.exports = app