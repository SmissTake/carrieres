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
}