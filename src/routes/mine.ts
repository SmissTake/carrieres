import express from "express";
import { MineController } from '../controllers/MineController';

const mineController = new MineController();

export const routerMine = express.Router({
    strict:true
});

routerMine.route('/mine/show/:id').get(mineController.read);
routerMine.route('/mine/add').post(mineController.create);
routerMine.route('/mine/update/:id').put(mineController.update);
routerMine.route('/mine/delete/:id').delete(mineController.delete);