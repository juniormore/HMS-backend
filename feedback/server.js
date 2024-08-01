const express = require('express');
const db = require('./db');
const cors = require('cors');
require('dotenv').config();
const app = express();
const axios = require('axios');

const SITE_SECRET = process.env.SITE_SECRET;

app.use(express.json());
app.use(cors());

app.get('/test', (req, res) => {
    res.send('Hello World');
})

app.get('/', (req, res) => {
    res.send('This API collects feedback from the front-end and sends it to the database.');
});

app.post('/api/verify', async (req, res) => {
	const { captchaValue } = req.body
	const { data } = await axios.post(
		`https://www.google.com/recaptcha/api/siteverify?secret=${SITE_SECRET}&response=${captchaValue}`,
	)
	res.send(data)
})

app.post('/api/feedback',  async (req, res) => {
    const { name, surname, email, discovery_source, improvements, rating, suggestions } = req.body;
	try{

		const query = 'INSERT INTO "Feedback" ("Hotel_ID", "Name", "Surname", "Email", discovery_source, "Improvements", rating, "Suggestions") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *';
    	const values = [1, name, surname, email, discovery_source, improvements, rating, suggestions];
    
    
    const result = await db.query(query, values);
    
    res.status(201).json({ message: 'Feedback received successfully!', feedback: result.rows[0] });
  } catch (error) {
    console.error('Error saving feedback:', error);
    res.status(500).json({ error: 'An error occurred while saving feedback.' });
  }
})

const port = 3000;
app.listen(port, () => {console.log(`Server is running on port ${port}`)});