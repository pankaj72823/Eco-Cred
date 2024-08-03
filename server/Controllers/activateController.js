import wrapAsync from "../Utils/wrapAsync.js";
import Challenge from "../Models/Challange.js";
import moment from 'moment';
import  jwt from "jsonwebtoken";
import mongoose from "mongoose";
const jwtSecret = "EcoCred#Carbon@X"


export const activateController=wrapAsync(async(req,res)=>{
    let userId;
   const decoded = jwt.verify(req.body.token, jwtSecret,(err, decoded) => {
    if (err) {
        return res.status(401).send('Invalid token');
    }
    else{
        userId = decoded.sub
    }
})
   const completionOn = moment().add(req.body.time_to_complete, 'minutes').toDate();
   const newChallenge = new Challenge({
       userId: new mongoose.Types.ObjectId(userId),
       category: req.body.category,
       challenge: req.body.challenge,
       reason: req.body.reason,
       time_to_complete: req.body.time_to_complete,
       difficult: req.body.difficult,
       status: 'ongoing',
       completion_on: completionOn
   });
    await newChallenge.save();
    const response = {
        "activated" : true
    }
    res.status(200).send(response)
})
