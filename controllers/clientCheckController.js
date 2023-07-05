const Room = require('../models/Room');
const Booking = require('../models/Booking');
const AvailableDate = require('../models/AvailableDate');
const sequelize = require("sequelize");

class clientCheckController {
    async getRoomList(req, res) {
        try {
            const roomList = await Room.findAll({
                attributes: ['roomNumber'],
            });
            const roomNumbers = roomList.map(room => room.roomNumber);
            res.json({ roomNumbers });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Ошибка сервера' });
        }
    }

    async getAvailableRooms(req, res) {
        try {
            const { startBook, endBook } = req.body;

            const availableRooms = await AvailableDate.findAll({
                where: {
                    startDate: startBook,
                    endDate: endBook
                },
                include: [{ model: Room }]
            });

            if (availableRooms.length > 0) {
                const roomNumbers = availableRooms.map(room => room.Room.roomNumber);
                res.status(200).json({ roomNumbers });
            } else {
                res.status(404).json({ message: 'Нет доступных комнат' });
            }

        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Ошибка сервера' });
        }
    }
}

module.exports = new clientCheckController();


