import { Request, Response } from "express";
import { Mine } from "../models/Mine";
import { CrudController } from "./CrudController";

export class MineController extends CrudController{
    public read(req: Request, res: Response): void{
        Mine.findByPk(req.params.id)
        .then((mine) => res.json(mine))
        .catch(error => {
            console.log(error)
            res.send('no mine found');
        });
    }

    public create(req: Request, res: Response): void {
        Mine.create(req.body)
        .then(mine => res.json(mine))
        .catch(err => {
            console.log(err);
            res.json({"message":"Insertion impossible"});
        });
    }

    public update(req: Request, res: Response): void {
        let id = req.params.id;
        let mineUpdate = req.body;

        Mine.findByPk(id)
        .then(mine => {
            if (mine !== null){
                mine.set(mineUpdate);
                mine.save();
                res.json({"message":"Modification effectué"});
            }
            else{
                res.json({"message":"no mine with id : $(id)"})
            }

        })
        .catch(err => {
            console.log(err);
            res.json({"message":"Modification impossible"});
        })
    }
}