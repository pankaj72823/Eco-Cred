import express from 'express'
import {profile} from '../Controllers/profileController.js'

const router = express.Router()

router.post('/', profile)



export {router as profileRouter}