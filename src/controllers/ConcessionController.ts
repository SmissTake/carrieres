import { Request, Response } from "express";
import { Concession } from "../models/Concession";
import { CrudController } from "./CrudController";

export class ConcessionController extends CrudController{
    public read(req: Request, res: Response): void{
        Concession.findByPk(req.params.id)
        .then((concession) => res.json(concession))
        .catch(error => {
            console.log(error)
            res.send('no concession found');
        });
    }

    public create(req: Request, res: Response): void {
        Concession.create(req.body)
        .then(concession => res.json(concession))
        .catch(err => {
            console.log(err);
            res.json({"message":"Insertion impossible"});
        });
    }

    public update(req: Request, res: Response): void {
        let id = req.params.id;
        let concessionUpdate = req.body;

        Concession.findByPk(id)
        .then(concession => {
            if (concession !== null){
                concession.set(concessionUpdate);
                concession.save();
                res.json({"message":"Modification effectué"});
            }
            else{
                res.json({"message":"no concession with id : $(id)"})
            }

        })
        .catch(err => {
            console.log(err);
            res.json({"message":"Modification impossible"});
        })
    }

    public delete(req: Request, res: Response): void {
        let id = req.params.id;

        Concession.findByPk(id)
        .then(concession => {
            if (concession !== null){
                concession.destroy();
                res.json({"message":"Suppression effectué"});
            }
            else{
                res.json({"message":"no concession with id : $(id)"})
            }

        })
        .catch(err => {
            console.log(err);
            res.json({"message":"Suppression impossible"});
        })
    }
}