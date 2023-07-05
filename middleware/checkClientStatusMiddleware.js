const Client = require('../models/Client');

const axios = require('axios');
const vipStatusAPI = 'http://example.com/api/vip-status';

async function checkClientStatusMiddleware(req, res, next) {
    try {
        const clientId = req.body.ClientId;

        const client = await Client.findByPk(clientId);

        if (!client) {
            return res.status(404).json({ error: 'Клиент не найден' });
        }

        const response = await axios.get(`${vipStatusAPI}?clientId=${clientId}`);

        const isVIP = response.data.isVIP;

        client.isVIP = isVIP;
        await client.save();

        req.client = client;

        next();
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Ошибка сервера' });
    }
}

module.exports = checkClientStatusMiddleware;
