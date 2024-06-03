const express = require('express');
const app = express();
const cors = require('cors');

app.use(cors());
app.use(express.json());

//Connect database
const mongodb = require('./config/mongodb');
mongodb.connect();


const userRouter = require('./routes/user');
app.use('/user', userRouter);

app.listen(3001, () => {
    console.log('Server is running on port 3001');
});