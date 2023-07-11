const Room = require('../models/Room');
const Booking = require('../models/Booking');
const AvailableDate = require("../models/AvailableDate");
const { Transaction } = require('sequelize');
const sequelize = require('../db');

class clientCreateBookingController {
    async createBooking(req, res) {
        const { startDate, endDate, RoomId, ClientId } = req.body;

        try {
            await sequelize.transaction(async (t) => {
                const availableRooms = await AvailableDate.findAll({
                    where: {
                        startDate: startDate,
                        endDate: endDate
                    },
                    include: [{ model: Room }],
                    transaction: t
                });

                if (availableRooms.length > 0) {
                    const booking = await Booking.create(
                        {
                            startDate,
                            endDate,
                            RoomId,
                            ClientId
                        },
                        { transaction: t }
                    );

                    await AvailableDate.destroy({
                        where: {
                            startDate: startDate,
                            endDate: endDate
                        },
                        transaction: t
                    });

                    res.json({ message: 'комната успешно забронирована' });

                } else {
                    res.status(404).json({ message: 'Нет доступных комнат' });
                }
            });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Ошибка сервера' });
        }
    }

    async cancelBooking(req, res) {
        try {
            const { bookingId } = req.params;

            await Booking.destroy({ where: { id: bookingId } });

            res.json({ message: 'Бронь успешно отменена' });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Ошибка сервера' });
        }
    }
}

module.exports = new clientCreateBookingController();
