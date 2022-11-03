import {Model, DataTypes} from 'sequelize';
import { sequelize } from '../config/database';

export class Adresse extends Model
{
    declare id: number;
    declare street: string;
    declare complement: string;
    declare zipcode: string;
    declare town: string;
}

Adresse.init({
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    street: {
        type: DataTypes.STRING,
        allowNull: true
    },
    complement: {
        type: DataTypes.STRING,
        allowNull: true
    },
    zipcode: {
        type: DataTypes.STRING,
        validate: {
            isNumeric: true,
            max: 5,
        },
        allowNull: true
    },
    town: {
        type: DataTypes.STRING,
        allowNull: false
    }
},
{
    sequelize,
    tableName: "adresses",
    timestamps: false
}
);