const { Op } = require('sequelize');
const Booking = require('../models/Booking');

async function checkBookingMiddleware(req, res, next) {
    const { startDate, endDate, RoomId } = req.body;

    try {
        const existingBooking = await Booking.findOne({
            where: {
                RoomId,
                startDate: { [Op.lt]: endDate },
                endDate: { [Op.gt]: startDate }
            }
        });

        if (existingBooking) {
            return res.status(400).json({ error: 'Номер комнаты уже забронирован на указанный период' });
        }

        next();
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Ошибка сервера' });
    }
}

module.exports = checkBookingMiddleware;