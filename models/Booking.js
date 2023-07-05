const { DataTypes } = require('sequelize');
const sequelize = require('../db');
const Room = require('./Room');
const Client = require('./Client');

const Booking = sequelize.define('Booking', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    startDate: {
        type: DataTypes.DATEONLY,
        comment: 'Дата начала бронирования',
    },
    endDate: {
        type: DataTypes.DATEONLY,
        comment: 'Дата окончания бронирования',
    },
}, {
    timestamps: false,
});

Room.hasMany(Booking)
Booking.belongsTo(Room)

Client.hasMany(Booking)
Booking.belongsTo(Client)

module.exports = Booking;
