import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
import { ClerkExpressWithAuth, ClerkExpressRequireAuth } from "@clerk/clerk-sdk-node";
import express from "express";



const app = express();
app.use(express.json());


app.get("/protected-endpoint", ClerkExpressRequireAuth({
      signInUrl: 'https://tight-tuna-42.accounts.dev/sign-in'
}), (req, res) => {
      res.json(req.auth);
});


const port = 3000;
app.listen(port, () => {console.log(`Server is running on port ${port}`)});