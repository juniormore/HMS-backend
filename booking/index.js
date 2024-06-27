const express = require('express');
const cors = require('cors');
const db = require('./db');


require('dotenv').config();

const app = express();
app.use(express.json());
app.use(cors());



app.get('/test', (req, res) => {
    res.send('Hello World');
})

app.get('/hotelSearch', async (req, res) => {

    const { location, checkInDate, checkOutDate, budget, numberOfGuests } = req.query;
    console.log(location, checkInDate, checkOutDate, numberOfGuests);

    try {
      const result = await db.query(`
        SELECT h."Name" AS hotel_name, 
              h."Location" AS hotel_location,
              h."Image" AS hotel_image, 
              rt."NumberOfGuests" AS number_of_guests, 
              rt."Price" AS room_price, 
              r."Room_ID" AS room_id, 
              rt."Description" AS room_description 
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

const port = process.env.PORT;
app.listen(port, () => {console.log(`Server is running on port ${port}`)});

