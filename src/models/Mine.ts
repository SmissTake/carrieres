import {Model, DataTypes} from 'sequelize';
import { sequelize } from '../config/database';
import { Concession } from './Concession';

export class Mine extends Model
{
    declare id: number;
    declare name: string;
    declare longitude: number;
    declare latitude: number;
    declare concessionId: number;
}

Mine.init({
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    longitude: {
        type: DataTypes.STRING,
        validate: {
            isNumeric: true,
        },
        allowNull: false
    },
    latitude: {
        type: DataTypes.STRING,
        validate: {
            isNumeric: true,
        },
        allowNull: false
    },
    concessionsId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: Concession,
            key: 'id',
        }
    }
},
{
    sequelize,
    tableName: "mines",
    timestamps: false
}
);

Mine.belongsTo(Concession, {foreignKey: 'concessionsId'});
Concession.hasOne(Mine, {foreignKey: 'id'});