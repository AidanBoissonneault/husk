import 'dotenv/config'
import mysql from 'mysql2'
import app from "./app.js"

// extract .env data
const { DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, PORT } = process.env

// validate .env data
if (!DB_HOST || !DB_USER || !DB_PASSWORD || !DB_NAME) {
  throw new Error('Missing required database environment variables')
}

// connect to MySQL
const connection = mysql.createConnection({
  host: DB_HOST,
  user: DB_USER,
  password: DB_PASSWORD,
  database: DB_NAME,
})

connection.connect((err) => {
  if (err) {
    console.error(`Error connecting to MySQL: ${err.stack}`);
    return;
  }

  console.log("connected to MySQL database")
});

// listening port
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})