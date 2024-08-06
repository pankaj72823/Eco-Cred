import express from 'express'
import { challenge } from '../Controllers/challengeController.js'
const router = express.Router()

router.post('/' , challenge)


export { router as challengeRouter}