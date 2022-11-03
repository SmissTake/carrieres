import express from "express";
import { ConcessionController } from '../controllers/ConcessionController';

const concessionController = new ConcessionController();

export const routerConcession = express.Router({
    strict:true
});

routerConcession.route('/concession/show/:id').get(concessionController.read);
routerConcession.route('/concession/add').post(concessionController.create);
routerConcession.route('/concession/update/:id').put(concessionController.update);
routerConcession.route('/concession/delete/:id').delete(concessionController.delete);
