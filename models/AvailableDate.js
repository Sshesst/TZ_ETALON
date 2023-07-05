const { DataTypes } = require('sequelize');
const sequelize = require('../db');
const Room = require('./Room');

const AvailableDate = sequelize.define('AvailableDate', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    startDate: {
        type: DataTypes.DATEONLY,
        comment: 'Дата начала свободной даты',
    },
    endDate: {
        type: DataTypes.DATEONLY,
        comment: 'Дата окончания свободной даты',
    },
}, {
    timestamps: false,
});

Room.hasMany(AvailableDate);
AvailableDate.belongsTo(Room);

module.exports = AvailableDate