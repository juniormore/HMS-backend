const express = require('express');
const db = require('./db');

const app = express();
app.use(express.json());

app.get('/test', (req,res)=> {
    res.send('contact');
})

app.get('/test1', async (req,res)=> {
   try{
        const result = await db.query(`
            SELECT * FROM public."Hotel"
            `);
        res.json(result.rows);
        console.log(result.rows);

   }catch(err){
        console.error(err);
        res.status(500).send('Internal Server Error');
   }
})

const port = 3000;
app.listen(port, () => {console.log (`Server is running on port ${port}`)});