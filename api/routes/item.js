const { Router} = require('express');

const itemController = require('../controller/item.js');

const itemRouter = Router();


itemRouter.get('/', itemController.index);
itemRouter.get('/:id', itemController.getOneById);
itemRouter.post('/', itemController.create);
itemRouter.delete('/:id', itemController.destroy);
itemRouter.patch('/:id', itemController.update);

module.exports = itemRouter;
