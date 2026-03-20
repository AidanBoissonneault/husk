import 'dotenv/config'
import mysql from 'mysql2/promise'

// add .env data
const { DB_HOST, DB_USER, DB_PASSWORD, DB_NAME } = process.env

// validate .env data
if (!DB_HOST || !DB_USER || !DB_PASSWORD || !DB_NAME) {
  throw new Error('Missing required database environment variables')
}

// connect to MySQL pool
const connection = mysql.createPool({
  host: DB_HOST,
  user: DB_USER,
  password: DB_PASSWORD,
  database: DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
})

export default connection
