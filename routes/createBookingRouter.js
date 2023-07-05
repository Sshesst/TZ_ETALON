const Router = require('express')
const router = new Router()

const clientCreateBookingController = require('../controllers/clientCreateBookingController')
const checkClientStatusMiddleware = require('../middleware/checkClientStatusMiddleware');
const checkBookingMiddleware = require('../middleware/checkBookingMiddleware');

router.post('/create',  checkBookingMiddleware, checkClientStatusMiddleware, clientCreateBookingController.createBooking)
router.delete('/delete/:bookingId', clientCreateBookingController.cancelBooking)

module.exports = router