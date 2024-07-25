const express = require('express');
const cors = require('cors');
const axios = require('axios');
const notificationapi = require("notificationapi-node-server-sdk").default;
const db = require('./db');

require('dotenv').config();

app.use(express.json());
app.use(cors());

const app = express()
const port = 6000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

// api endpoint to create a booking
app.post('/booking', async (req, res) => {
	const { booking_date, check_in_date, check_out_date, status, room_id, guest_id, payment_id, phone_number, email } = req.body;
	const message = "Your booking has been confirmed. Thank you for choosing us."

	try{
		
        const query = 'INSERT INTO "Bookings" ("booking_Date", "checkIn_date", "checkOut_date", "Status", "Room_ID", "Guest_ID") VALUES ($1, $2, $3, $4, $5, $6) RETURNING *';
    	const values = [booking_date, check_in_date, check_out_date, status, room_id, guest_id, payment_id, phone_number, email];
    
    
        const result = await db.query(query, values);
        

		res.status(201).send('Booking created successfully');
		console.log(result.rows);

		smsNotification(req, res, phone_number, message);
		sendEmailNotification(req, res, email, message);

	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}
});

// api endpoint to retrieve information about a specific room using its room id
app.get('/roomInformation/:room_id', async (req, res) => {
	const { room_id }  = req.params;

  try{
    const result = await db.query(`
        SELECT 
            rt."RoomName" AS room_name,
            rt."Description1" AS room_description_1,
            rt."Description2" AS room_description_2,
            rt."NumberOfGuests" AS number_of_guests,
            rt."Price" AS room_price,
            rt."Image1" As image_1,
            rt."Image2" As image_2,
            rt."Bedrooms" AS bedrooms,
            rt."Bathrooms" AS bathrooms
        FROM 
            public."Room_Type" rt
        JOIN 
            public."Room" r ON rt."RoomType_ID" = r."RoomType_ID"
        WHERE
            r."Room_ID" = ${room_id}
    `);

    res.json(result.rows);
    console.log(result.rows);
  }catch(err){
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
});


app.listen(port, () => {
  console.log(`Server listening on port ${port}`)
})