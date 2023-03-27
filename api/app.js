const express = require('express')
const cors = require('cors')

const items = require('./routes/item')

const app = express()
app.use(cors())
app.use(express.json())

app.use('/items', items)

module.exports = app