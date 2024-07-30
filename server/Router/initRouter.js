import express from 'express'
import User from '../Models/User.js';
import dummyData from '../Utils/dummyData.js';

const router = express.Router();

router.get('/',async(req,res)=>{
    const data =await User.insertMany(dummyData);
    res.send("Done")
})

export {router as initRouter}