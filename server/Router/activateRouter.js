import express from 'express'
import { activateController } from '../Controllers/activateController.js';

const router = express.Router();

router.post('/' ,activateController)

export {router as activateRouter}