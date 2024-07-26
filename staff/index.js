const express = require('express');
const cors = require('cors');
const axios = require('axios');
//const notificationapi = require("notificationapi-node-server-sdk").default;
const db = require('./db');

require('dotenv').config();


const app = express()
const port = 3333

app.use(express.json());
app.use(cors());

app.get('/test', (req, res) => {
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

		//smsNotification(req, res, phone_number, message);
		//sendEmailNotification(req, res, email, message);

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


// api endpoint to create a guest
app.post('/guest', async (req, res) => {

	const { guest_id, email, phone_number, full_name, hotel_id } = req.body;

	// check if guest already exists
	try{
		const result = await db.query(`
			SELECT * FROM public."Guest" WHERE "Guest_ID" = '${guest_id}';
		`);

		if(result.rows.length > 0){
			console.log('Guest already exists');
			res.status(200).send('Guest already exists');
			return;
		}
	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}
		

	try{
		const result = await db.query(`
			INSERT INTO public."Guest"(
				"Full_Name",
				"Contact_Number",  
				"Email", 
				"Guest_ID") 
			VALUES (
				'${full_name}',
				${phone_number},  
				'${email}', 
				'${guest_id}'); 
		`);

		res.status(201).send('Guest created successfully');
		console.log(result.rows);
	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}

	const hotelGuest = (hotel_id) => {
		try{
			const result = db.query(`
				INSERT INTO public."Hotel_Guest"(
					"Hotel_ID", 
					"Guest_ID") 
				VALUES (
					${hotel_id},
					'${guest_id}'); 
			`);
			console.log(result.rows);
			res.status(201).send('Hotel Guest created successfully');
		}catch(err){
			console.error(err);
			res.status(500).send('Internal Server Error');
		}
	
	}

});

// create Hotel_Guest table record
app.post('/hotelGuest', async (req, res) => {
	const { hotel_id, guest_id } = req.body;

	// check if hotel guest already exists
	try{
		const result = await db.query(`
			SELECT * FROM public."Hotel_Guest" WHERE "Hotel_ID" = ${hotel_id} AND "Guest_ID" = '${guest_id}';
		`);

		if(result.rows.length > 0){
			console.log('Hotel Guest already exists');
			res.status(200).send('Hotel Guest already exists');
			return;
		}
	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}

	try{
		const result = await db.query(`
			INSERT INTO public."Hotel_Guest"(
				"Hotel_ID", 
				"Guest_ID") 
			VALUES (
				${hotel_id},
				'${guest_id}'); 
		`);

		res.status(201).send('Hotel Guest created successfully');
		console.log(result.rows);
	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}
});

// api endpoint to get a user's list upcoming bookings
app.get('/upcomingBookings', async (req, res) => {

	// get current date in form yyyy-mm-dd
	//const today = new Date();

	try{
		const result = await db.query(`
			SELECT 
				n."Full_Name",
				b."booking_Date",
				b."checkIn_date", 
				b."checkOut_date", 
				h."Name" AS hotel_name,
				rt."RoomName",
				p."Amount", 
				rt."NumberOfGuests",
				b."Status"
			FROM public."Bookings" b
			JOIN public."Guest" n ON b."Guest_ID" = n."Guest_ID"
			JOIN public."Room" r ON b."Room_ID" = r."Room_ID"
			JOIN public."Hotel" h ON r."Hotel_ID" = h."Hotel_ID"
			JOIN public."Payment" p ON b."Payment_ID" = p."Payment_ID"
			JOIN public."Room_Type" rt ON r."RoomType_ID" = rt."RoomType_ID"
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