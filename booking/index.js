const express = require('express');
const db = require('./db');


require('dotenv').config();

const app = express();
app.use(express.json());



app.get('/test', (req, res) => {
    res.send('Hello World');
})

app.get('/hotelSearch', async (req, res) => {

    const { location, checkInDate, checkOutDate, numberOfGuests } = req.body;

    try {
      const result = await db.query(`
        SELECT DISTINCT h."Hotel_ID", h."Name", h."Location", h."Rating", h."Contact_Number" 
            FROM public."Hotel" h
            JOIN public."Room" r ON h."Hotel_ID" = r."Hotel_ID"
            JOIN public."Room_Type" rt ON r."RoomType_ID" = rt."RoomType_ID"
            LEFT JOIN public."Bookings" b ON r."Room_ID" = b."Room_ID" 
            AND b."Status" = 'Confirmed'
            AND (b."checkIn_date" < '${checkOutDate}' AND b."checkOut_date" > '${checkInDate}')
        WHERE h."Location" = '${location}'
            AND rt."NumberOfGuests" >= ${numberOfGuests}
            AND r."Status" = TRUE
            AND b."Booking_ID" IS NULL`);
      res.json(result.rows);
    } catch (err) {
      console.error(err);
      res.status(500).send('Internal Server Error');
    }
  });

const port = process.env.PORT;
app.listen(port, () => {console.log(`Server is running on port ${port}`)});

