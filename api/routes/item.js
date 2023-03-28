const express = require('express')
const router = express.Router()
const items = require('../controller/item')

itemRouter.get('/', itemController.index);
itemRouter.get('/:id', itemController.getOneById);
itemRouter.post('/', itemController.create);
itemRouter.delete('/:id', itemController.destroy);
itemRouter.patch('/:id', itemController.update);

module.exports = itemRouter;
