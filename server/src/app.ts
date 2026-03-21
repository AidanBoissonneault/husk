import 'dotenv/config'
import express from 'express'
import testRoute from './test/test.js'
import getBeans from './getBeans/getBeans.js'

const { CLIENT_PORT } = process.env

if (!CLIENT_PORT) {
  throw new Error('Missing required client port variable')
}

const app = express()

app.use(express.json())
app.use('/api/test', testRoute)
app.use('/api/getbeans', getBeans)

export default app
