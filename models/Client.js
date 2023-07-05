const { DataTypes } = require('sequelize');
const sequelize = require('../db');

const Client = sequelize.define('Client', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    name: {
        type: DataTypes.STRING,
        comment: 'Имя клиента',
    },
    contact: {
        type: DataTypes.STRING,
        comment: 'Контактные данные клиента',
    },
    isVIP: {
        type: DataTypes.BOOLEAN,
        defaultValue: false,
        comment: 'Флаг VIP-клиента',
    },
}, {
    timestamps: false,
});

module.exports = Client;
