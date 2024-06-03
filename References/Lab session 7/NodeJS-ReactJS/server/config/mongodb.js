const { MongoClient } = require('mongodb');

let dbInstance = null;

// Database Name
const dbName = 'lab7WAD';

async function connect() {
    // Connection URL
    const url = 'mongodb://localhost:27017/lab7WAD';
    const client = new MongoClient(url, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
    });

    await client.connect();
    dbInstance = client.db(dbName);
    console.log('Connection successful');
}

async function getDB() {
    if (!dbInstance) throw new Error('Must connect database first');
    return dbInstance;
}

module.exports = { connect, getDB };