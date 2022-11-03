import express from "express";
import { MineController } from '../controllers/MineController';
import * as Auth from '../middleware/authenticate';

const mineController = new MineController();

export const routerMine = express.Router({
    strict:true
});

routerMine.route('/mine/show/:id').get(mineController.read);
routerMine.route('/mine/add').post(Auth.authorize(['Administrateur']), mineController.create);
routerMine.route('/mine/update/:id').put(Auth.authorize(['Administrateur']), mineController.update);
routerMine.route('/mine/delete/:id').delete(Auth.authorize(['Administrateur']), mineController.delete);