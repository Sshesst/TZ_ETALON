const Router = require('express')
const router = new Router()
const checkRouter = require('./checkRouter')
const createBookingRouter = require('./createBookingRouter')

router.use('/check', checkRouter)
router.use('/booking', createBookingRouter)

module.exports = router