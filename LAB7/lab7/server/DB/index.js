import { createPool } from 'mysql2';
import dotenv from 'dotenv';
dotenv.config();

const pool = createPool({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE_NAME,
  port: parseInt(process.env.MYSQL_PORT, 10),
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

const connectToDatabase = async () => {
  try {
    const connection = await pool.promise().getConnection();
    console.log("MySQL Connection Successful");
    connection.release(); // Make sure to release the connection
  } catch (error) {
    console.error("Database Connection Error:", error);
    throw error;
  }
};

export { connectToDatabase, pool };
