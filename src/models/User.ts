import {Model, DataTypes} from 'sequelize';
import { sequelize } from '../config/database';
import { Permission } from './Permission';

export class User extends Model
{
    declare id: number;
    declare lastname: string;
    declare firstname: string;
    declare mail: string;
    declare password: string;
    declare idPermissions: number;
}

User.init({
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    lastname: {
        type: DataTypes.STRING,
        validate: {
            isAlpha: true,
        },
        allowNull: false
    },
    firstname: {
        type: DataTypes.STRING,
        validate: {
            isAlpha: true,
        },
        allowNull: false
    },
    mail: {
        type: DataTypes.STRING,
        validate: {
            isEmail: true,
            max: 200,
        },
        allowNull: false
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false
    },
    idPermissions: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: Permission,
            key: 'id',
        }
    }
},
{
    sequelize,
    tableName: "users",
    timestamps: false
}
);

User.belongsTo(Permission, {foreignKey: "idPermissions"});