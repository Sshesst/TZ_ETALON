const Router = require('express')
const router = new Router()

const clientCheckController = require('../controllers/clientCheckController')

router.get('/rooms', clientCheckController.getRoomList)
router.get('/available', clientCheckController.getAvailableRooms)

module.exports = router