const { Router} = require('express');

const itemController = require('../controller/item.js');

const itemRouter = Router();


itemRouter.get('/', itemController.index);
itemRouter.get('/:id', itemController.getOneById);
itemRouter.get('/user/:id', itemController.getByUserId);
itemRouter.post('/', itemController.create);
itemRouter.delete('/:id', itemController.destroy);
itemRouter.patch('/:id', itemController.update);

module.exports = itemRouter;
