import express from 'express'
import { answers ,result } from '../Controllers/answersController.js'
const router = express.Router()

router.post('/',answers)

router.get('/',result)

export {router as answersRouter}