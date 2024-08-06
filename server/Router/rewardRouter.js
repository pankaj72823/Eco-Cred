import express from 'express'
import { reward } from '../Controllers/rewardController.js'

const router = express.Router()

router.post('/',reward)

export {router as rewardRouter}