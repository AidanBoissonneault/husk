import "dotenv/config";
import express from "express";
import cors from "cors";
import testRoute from './test/test.js'

const { CLIENT_PORT } = process.env;

if (!CLIENT_PORT) {
  throw new Error("Missing required client port variable");
}

const app = express();

app.use(
  cors({
    origin: `http://localhost:${CLIENT_PORT}`,
  }),
);
app.use(express.json());
app.use('/api/test', testRoute)

export default app;
