import "dotenv/config";
import app from "./app.js"

// extract .env data
const { PORT } = process.env

// listening port
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})