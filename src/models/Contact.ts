import {Model, DataTypes} from 'sequelize';
import { sequelize } from '../config/database';
import { Concession } from './Concession';

export class Contact extends Model
{
    declare id: number;
    declare street: string;
    declare complement: string;
    declare zipcode: string;
    declare town: string;
}

Contact.init({
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    lastname: {
        type: DataTypes.STRING,
        allowNull: false
    },
    firstname: {
        type: DataTypes.STRING,
        allowNull: true
    },
    mail: {
        type: DataTypes.STRING,
        validate: {
            isEmail: true,
            max: 150
        },
        allowNull: true
    },
    phone: {
        type: DataTypes.STRING,
        validate: {
            max: 10
        },
        allowNull: true
    },
    
},
{
    sequelize,
    tableName: "contacts",
    timestamps: false
}
);

Concession.hasMany(Contact, {foreignKey: "concessionsId"});
Contact.belongsTo(Concession, {foreignKey: "concessionsId"});