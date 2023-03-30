const { Router } = require('express');

const userController = require('../controller/user');

const userRouter = Router();

userRouter.get("/check", userController.check);
userRouter.post('/register', userController.register);
userRouter.post("/login", userController.login);
userRouter.get("/logout", userController.logout);
userRouter.get("/user", userController.user);
userRouter.get("/user/:id", userController.user);
userRouter.patch("/user/:id", userController.update);

module.exports = userRouter;
