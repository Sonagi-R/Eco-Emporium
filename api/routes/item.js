const express = require('express')
const router = express.Router()
const items = require('../controller/item')

router.get('/', items.index)

router.get('/:id', items.getOneById)

router.post('/', items.create)

router.delete('/:id', items.destroy)

router.patch('/:id', items.update)

module.exports = router