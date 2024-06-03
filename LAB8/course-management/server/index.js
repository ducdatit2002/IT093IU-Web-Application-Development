import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
dotenv.config();

import { connectToDatabase } from './DB/index.js'; // Ensure the path is correct
import appRoute from './routes/index.js';

const app = express();
const PORT = process.env.PORT || 4000;

app.use(cors());

app.use(express.json());
app.use('/api/v1/courses', appRoute);

app.get('/', (req, res) => {
  res.send('Hello World');
});

app.post('/', (req, res) => {
  console.log(req.body);
  res.send('POST request to the homepage');
});

connectToDatabase()
  .then(() => {
    app.listen(PORT, () => {
      console.log(`Server running on: http://localhost:${PORT}`);
    });
  })
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });