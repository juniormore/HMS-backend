const express = require('express');
const cors = require('cors');
const axios = require('axios');
const db = require('./db');

require('dotenv').config();

const app = express();
app.use(express.json());
app.use(cors());

// api endpoint to search for a hotel room based on search criteria
app.get('/hotelSearch', async (req, res) => {

    const { location, checkInDate, checkOutDate, budget, numberOfGuests } = req.query;
    console.log(location, checkInDate, checkOutDate, numberOfGuests);

    try {
      const result = await db.query(`
        SELECT h."Name" AS hotel_name, 
              h."Location" AS hotel_location,
              h."Image" AS hotel_image,
              h."Rating" AS hotel_rating, 
              rt."NumberOfGuests" AS number_of_guests, 
              rt."Price" AS room_price,
              rt."Bedrooms" AS bedrooms,
              rt."Bathrooms" AS bathrooms,
              r."Room_ID" AS room_id  
            FROM public."Hotel" h
            JOIN public."Room" r ON h."Hotel_ID" = r."Hotel_ID"
            JOIN public."Room_Type" rt ON r."RoomType_ID" = rt."RoomType_ID"
            LEFT JOIN public."Bookings" b ON r."Room_ID" = b."Room_ID" 
            AND b."Status" = 'Confirmed'
            AND (b."checkIn_date" < '${checkOutDate}' AND b."checkOut_date" > '${checkInDate}')
        WHERE h."Location" = '${location}'
            AND rt."NumberOfGuests" >= ${numberOfGuests}
            AND r."Status" = TRUE
            AND rt."Price" <= ${budget}
            AND b."Booking_ID" IS NULL`);
      res.json(result.rows);
      console.log(result.rows);
    } catch (err) {
      console.error(err);
      res.status(500).send('Internal Server Error');
    }
});

// api endpoint to retrieve hotel room information of all available rooms
app.get('/hotelCatalog', async (req, res) => {
	try {
		const result = await db.query(`
			SELECT h."Name" AS hotel_name, 
					h."Location" AS hotel_location,
					h."Image" AS hotel_image,
					h."Rating" AS hotel_rating, 
					rt."NumberOfGuests" AS number_of_guests, 
					rt."Price" AS room_price,
					rt."Bedrooms" AS bedrooms,
					rt."Bathrooms" AS bathrooms,
					r."Room_ID" AS room_id  
				FROM public."Hotel" h
				JOIN public."Room" r ON h."Hotel_ID" = r."Hotel_ID"
				JOIN public."Room_Type" rt ON r."RoomType_ID" = rt."RoomType_ID"
				LEFT JOIN public."Bookings" b ON r."Room_ID" = b."Room_ID" 
				AND b."Status" = 'Confirmed'
			WHERE 
				r."Status" = TRUE          
				AND b."Booking_ID" IS NULL`);
		res.json(result.rows);
		console.log(result.rows);
  } catch (err) {
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

	const { guest_id, email, phone_number, first_name, last_name, hotel_id } = req.body;
	const full_name = first_name + ' ' + last_name;

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
app.post('/HotelGuest', async (req, res) => {
	const { hotel_id, guest_id } = req.body;

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

// api endpoint to create a booking
app.post('/booking', async (req, res) => {
	const { booking_date, check_in_date, check_out_date, status, room_id, guest_id, payment_id, phone_number } = req.body;
	const message = "Your booking has been confirmed. Thank you for choosing us."

	try{
		const result = await db.query(`
			INSERT INTO public."Bookings"(
				"booking_Date", 
				"checkIn_date", 
				"checkOut_date", 
				"Status", 
				"Room_ID", 
				"Guest_ID",
        "Payment_ID")
			VALUES (
				'${booking_date}', 
				'${check_in_date}', 
				'${check_out_date}', 
				'${status}', 
				${room_id}, 
				'${guest_id}',
        ${payment_id});
			`);

		res.status(201).send('Booking created successfully');
		console.log(result.rows);

		//smsNotification(req, res, phone_number, message);

	}catch(err){
		console.error(err);
		res.status(500).send('Internal Server Error');
	}
}); 

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
  

const port = process.env.PORT;
app.listen(port, () => {console.log(`Server is running on port ${port}`)});

