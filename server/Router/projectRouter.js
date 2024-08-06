import express from 'express'
import wrapAsync from '../Utils/wrapAsync.js'
import Project from '../Models/Project.js'


const router = express.Router()

router.get('/', wrapAsync(async(req,res)=>{
    const response = await Project.find().select('-_id -__v');;
    res.status(200).send(response)
}))

export {router as projectRouter}