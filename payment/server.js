// server.js
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const paypal = require('@paypal/checkout-server-sdk');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// PayPal environment configuration
const environment = new paypal.core.SandboxEnvironment('AfESDRCJOJeFOnINtaN5ErFmr6hl7pFNeLoZ99trVOve6LwrlPztVJvaF5P3HLj6lcsFY5RAvb_3K2ko', 'EDht7slhX4OZzMqSm6EzgK_IBMFg09XT4LU3gwMq-ZyG-5rcpy9TvMHSAfU4VnPxyvNWSJcj0hK6rub9');
const client = new paypal.core.PayPalHttpClient(environment);

app.get('/test', (req, res) => {
  res.send('Hello World');
})
// Create order endpoint
app.post('/create-order', async (req, res) => {
  const request = new paypal.orders.OrdersCreateRequest();
  const  { price }  = req.body;
  request.prefer("return=representation");
  request.requestBody({
    intent: 'CAPTURE',
    purchase_units: [{
      amount: {
        currency_code: 'USD',
        value: price // Replace with dynamic value as needed
      }
    }]
  });

  try {
    const order = await client.execute(request);
    res.json(order.result);
  } catch (err) {
    res.status(500).send(err);
  }
});

// Capture order endpoint
app.post('/capture-order', async (req, res) => {
  const { orderID } = req.body;
  const request = new paypal.orders.OrdersCaptureRequest(orderID);
  request.requestBody({});

  try {
    const capture = await client.execute(request);
    res.json(capture.result);
  } catch (err) {
    res.status(500).send(err);
  }
});

// Start the server
const PORT = 5000;
app.listen(PORT, () => console.log(`Server started on port ${PORT}`));
