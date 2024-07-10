const express = require('express');
const db = require('./db');
const cors = require('cors');
require('dotenv').config();
const app = express();

app.use(express.json());
app.use(cors());

app.get('/test', (req, res) => {
    res.send('Hello World');
})

app.get('/', (req, res) => {
    res.send('This API collects feedback from the front-end and sends it to the database.');
});

app.post('/api/feedback',  async (req, res) => {
    const { name, surname, email, discovery_source, improvements, rating, Suggestions } = req.body;
    
	try{
		const result = await db.query(`
			INSERT INTO public."Feedback"(
				"Hotel_ID", 
				"Name", 
				"Surname", 
				"Email", 
				"discovery_source", 
				"Improvements",
				"rating",
				"Suggestions")
			VALUES (
                '1',
				'${name}', 
				'${surname}', 
				'${email}', 
				'${discovery_source}', 
                '${improvements}',
				${rating}, 
				'${Suggestions}');
			`);

		res.status(201).send('Feedback submitted successfully.');
		console.log(result.rows);

	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}
})

const port = process.env.PORT;
app.listen(port, () => {console.log(`Server is running on port ${port}`)});