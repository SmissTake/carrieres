import express from "express";
import { ConcessionController } from '../controllers/ConcessionController';
import * as Auth from '../middleware/authenticate';

const concessionController = new ConcessionController();

export const routerConcession = express.Router({
    strict:true
});

routerConcession.route('/concession/show/:id').get(concessionController.read);
routerConcession.route('/concession/show/mines/:id').get(concessionController.readMines);
routerConcession.route('/concession/show/contact/:id').get(concessionController.readContacts);
routerConcession.route('/concession/all/:id').get(concessionController.readAll);
routerConcession.route('/concession/add').post(Auth.authorize(['Administrateur']), concessionController.create);
routerConcession.route('/concession/update/:id').put(Auth.authorize(['Administrateur']), concessionController.update);
routerConcession.route('/concession/delete/:id').delete(Auth.authorize(['Administrateur']), concessionController.delete);