const { Router } = require('express');

const userController = require('../controller/user');

const userRouter = Router();

userRouter.get("/check", userController.check);
userRouter.post("/register", userController.register);
userRouter.post("/login", userController.login);
userRouter.get("/logout", userController.logout);
userRouter.get("/user", userController.user);

module.exports = userRouter;