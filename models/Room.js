const { DataTypes } = require('sequelize');
const sequelize = require('../db');

const Room = sequelize.define('Room', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    roomNumber: {
        type: DataTypes.INTEGER,
        unique: true,
        comment: 'Номер комнаты в отеле',
    },
    roomType: {
        type: DataTypes.STRING,
        comment: 'Тип комнаты ( одноместный, двухместный )',
    },
}, {
    timestamps: false,
});

module.exports = Room;
