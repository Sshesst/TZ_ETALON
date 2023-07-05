require('dotenv').config();
const express = require('express');
const cors = require('cors')
const sequelize = require('./db');
const Room = require('./models/Room');
const Booking = require('./models/Booking');
const Client = require('./models/Client');
const AvailableDate = require('./models/AvailableDate');
const router = require('./routes')

const PORT = process.env.PORT;

const app = express();
app.use(cors())
app.use(express.json());

app.use('/', router)

const start = async () => {
    try {
        await sequelize.authenticate();
        console.log('Соединение с базой данных успешно установлено.');

        await sequelize.sync();
        console.log('Модели успешно синхронизированы с базой данных.');

        app.listen(PORT, () => {
            console.log(`Сервер запущен на порту ${PORT}.`);
        });
    } catch (error) {
        console.error('Ошибка при запуске сервера:', error);
    }
};

start();