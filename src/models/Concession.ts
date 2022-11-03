import {Model, DataTypes} from 'sequelize';
import { sequelize } from '../config/database';
import { Adresse } from './Adresse';
import { Mine } from './Mine';

export class Concession extends Model
{
    declare id: number;
    declare name: string;
    declare siret: string;
    declare licence: string;
    declare phone: number;
    declare adresseId: number;
}

Concession.init({
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    siret: {
        type: DataTypes.STRING,
        validate: {
            isNumeric: true,
            max: 12,
        },
        allowNull: false
    },
    license: {
        type: DataTypes.STRING,
        allowNull: false
    },
    phone: {
        type: DataTypes.STRING,
        validate: {
            isNumeric: true,
            max: 10,
        },
        allowNull: true
    },
    adressesId: {
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
    tableName: "concessions",
    timestamps: false
}
);

Concession.belongsTo(Adresse, {foreignKey: "adressesId"});