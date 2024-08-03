const express = require('express');
const cors = require('cors');
const axios = require('axios');
const notificationapi = require("notificationapi-node-server-sdk").default;
const db = require('./db');

require('dotenv').config();


const app = express()
const port = 3333

app.use(express.json());
app.use(cors());

app.get('/test', async (req, res) => {
  res.send('Hello World!')
})

//a function to get the current date and format it
function getDate(){
	const date = new Date();
	const year = date.getFullYear();
	const month = String(date.getMonth() + 1).padStart(2, "0");
	const day = String(date.getDate()).padStart(2, "0");

	return `${year}-${month}-${day}`;
};

//A function to generate random guest ID
function generateRandomID() {
	const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	let randomID = '';
	for (let i = 0; i < 32; i++) {
		const randomIndex = Math.floor(Math.random() * characters.length);
		randomID += characters[randomIndex];
	}
	return randomID;
}

// api endpoint to create a guest
app.post('/reserveBooking', async (req, res) => {
	const message = "Your booking has been confirmed. Thank you for choosing us."
	const { firstName,
		lastName,
		email,
		phone_number,
		hotel_id,
		checkInDate,
		checkOutDate,
		room_id,
		newStatus} = req.body;

	const guest_id = generateRandomID();
	const booking_Date = getDate();
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
		
	const full_name = firstName + " " + lastName;
	console.log({full_name, email, phone_number, guest_id});
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

		//res.status(201).send('Guest created successfully');
		console.log(result.rows);
	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}

	// check if hotel guest already exists
	try{
		const result = await db.query(`
			SELECT * FROM public."Hotel_Guest" WHERE "Hotel_ID" = ${hotel_id} AND "Guest_ID" = '${guest_id}';
		`);

		if(result.rows.length > 0){
			console.log('Hotel Guest already exists');
			//res.status(200).send('Hotel Guest already exists');
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

		//res.status(201).send('Hotel Guest created successfully');
		console.log(result.rows);
	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}

	try{

		const query = 'INSERT INTO "Bookings" ("booking_Date", "checkIn_date", "checkOut_date", "Room_ID", "Guest_ID" , "Status") VALUES ($1, $2, $3, $4, $5, $6) RETURNING *';
    	const values = [booking_Date, checkInDate, checkOutDate, room_id, guest_id, newStatus];
    
    
    const result = await db.query(query, values);
    	
	smsNotification(req, res, phone_number, message);
	sendEmailNotification(req, res, email, message);

    res.status(201).json({ message: 'Booking created successfully!', booking: result.rows[0] });
  } catch (error) {
    console.error('Error creating booking:', error);
    res.status(500).json({ error: 'An error occurred while creating the booking.' });
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
				b."Booking_ID",
				b."checkIn_date", 
				b."checkOut_date", 
				h."Name" AS hotel_name,
				rt."RoomName",
				rt."NumberOfGuests",
				b."Status"
			FROM public."Bookings" b
			JOIN public."Guest" n ON b."Guest_ID" = n."Guest_ID"
			JOIN public."Room" r ON b."Room_ID" = r."Room_ID"
			JOIN public."Hotel" h ON r."Hotel_ID" = h."Hotel_ID"
			JOIN public."Room_Type" rt ON r."RoomType_ID" = rt."RoomType_ID"
			WHERE b."Status" NOT IN ('Cancelled','Checked-out')
			
		`);

		res.json(result.rows);
		console.log(result.rows);
	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}

});

// api endpoint to cancel a booking
app.put('/checkIn/:booking_id', async (req, res) => {
	const { booking_id } = req.params;

	try{
		const result = await db.query(`
			UPDATE public."Bookings"
			SET "Status" = 'Checked-in'
			WHERE "Booking_ID" = ${booking_id};
		`);

		res.status(200).send('Checked-in successfully');
		console.log(result.rows);
	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}
});

// api endpoint to cancel a booking
app.put('/checkOut/:booking_id', async (req, res) => {
	const { booking_id } = req.params;

	try{
		const result = await db.query(`
			UPDATE public."Bookings"
			SET "Status" = 'Checked-out'
			WHERE "Booking_ID" = ${booking_id};
		`);

		res.status(200).send('Checked-out successfully');
		console.log(result.rows);
	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}
});

app.put('/confirmBooking/:booking_id', async (req, res) => {
	const { booking_id } = req.params;

	try{
		const result = await db.query(`
			UPDATE public."Bookings"
			SET "Status" = 'Confirmed'
			WHERE "Booking_ID" = ${booking_id};
		`);

		res.status(200).send('Booking confirmed successfully');
		console.log(result.rows);
	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}
});

app.put('/pending/:booking_id', async (req, res) => {
	const { booking_id } = req.params;

	try{
		const result = await db.query(`
			UPDATE public."Bookings"
			SET "Status" = 'Pending'
			WHERE "Booking_ID" = ${booking_id};
		`);

		res.status(200).send('Success!');
		console.log(result.rows);
	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}
});

// api endpoint to get feedback data for pie chart
app.get('/feedbackData', async (req, res) => {
	try{
		const result = await db.query(`
			SELECT 
				discovery_source AS type,
				(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM public."Feedback")) AS percentage
			FROM 
				public."Feedback"
			GROUP BY 
				discovery_source;`
		);

		res.json(result.rows);
	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}
});

// api endpoint to get occupancy data
app.get('/occupancyData', async (req, res) => {

	const current_year = new Date().getFullYear();

	try{
		const result = await db.query(`
			SELECT 
				EXTRACT(MONTH FROM b."checkIn_date") AS month,
				COUNT(*) AS rate
			FROM 
				public."Bookings" b
			WHERE 
				EXTRACT(YEAR FROM b."checkIn_date") = ${current_year}
			GROUP BY 
				month
			ORDER BY 
				month;	
		`);
		
		const data = result.rows;

		// replace month number with month name
		const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
		for (const row of data) {
			row.month = months[row.month - 1];
		}
		res.json(data);

	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}
});

// api endpoint to get a user's list upcoming bookings
app.get('/showRooms/:hotel_id', async (req, res) => {
	const { hotel_id }  = req.params;
	// get current date in form yyyy-mm-dd
	//const today = new Date();

	try{
		const result = await db.query(`
			SELECT rt."RoomName",
			r."Room_ID"
			FROM public."Room_Type" rt, public."Room" r
			WHERE rt."RoomType_ID" = r."RoomType_ID"
			AND r."Hotel_ID" = ${hotel_id}
		`);

		res.json(result.rows);
		//console.log(result.rows);
	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}

});


// function to send sms notification
async function smsNotification(req, res, phone_number, message) {
	try {
		const url = 'https://rest.kaelekae.com/';
		const data = { 
			action : "send_nnollo_sms",
			token: process.env.SMS_API_TOKEN,
			sender_id: process.env.SMS_SENDER_ID,
			sms_content: message,
			destinations: [
				phone_number
			]
	  	};
	  
	  const response = await axios.post(url, data);
	  res.status(200);
	} catch (error) {
	  console.error('Error sending data:', error);
	  res.status(500).json({ message: 'Error' });
	}
}

// function to send email notification
async function sendEmailNotification(req, res, email, message){
	try{
		notificationapi.init(
			process.env.NOTIFICATION_API_CLIENT_ID, // clientId
			process.env.NOTIFICATION_API_CLIENT_SECRET // clientSecret
		  )
		  
		  notificationapi.send({
			notificationId: 'booking_confirmation',
			user: {
			  id: email,
			  email: email,
			  number: "77777777"
			},
			mergeTags: {
			  "comment": message
			}
		  })

		  res.status(200);

	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}
	
}  


app.listen(port, () => {
  console.log(`Server listening on port ${port}`)
})