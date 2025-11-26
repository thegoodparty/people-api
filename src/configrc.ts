import { config } from 'dotenv'
process.env.ENV_PATH ? config({ path: process.env.ENV_PATH }) : config()
