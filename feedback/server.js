const express = require('express');
const { Pool } = require('pg');
const app = express();

const pool = new Pool({
    user:'postgres',
    host:'localhost',
    database: 'HMS',
    password:'postgres',
    port: 5432,
})

app.use(express.json());

app.get('/test', (res, req) => {
    res.send('Hello World');
})

app.get('/', (req, res) => {
    res.send('This API collects feedback from the front-end and sends it to the database.');
});

app.post('/api/feedback',  async (req, res) => {
    const { name, email, message } = res.body;
    

})