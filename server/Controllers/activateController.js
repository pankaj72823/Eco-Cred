import wrapAsync from "../Utils/wrapAsync.js";
import Challenge from "../Models/Challange.js";
import moment from 'moment';
import  jwt from "jsonwebtoken";
import mongoose from "mongoose";
const jwtSecret = "EcoCred#Carbon@X"


export const activateController=wrapAsync(async(req,res)=>{
    let userId;
    const activate_challenge = req.body._id
   const decoded = jwt.verify(req.body.token, jwtSecret,(err, decoded) => {
    if (err) {
        return res.status(401).send('Invalid token');
    }
    else{
        userId = decoded.sub
    }
})
    const all_challange = await Challenge.updateMany({userId : userId,status : "available"},{ status: "blocked" }  )
    const challange_to_activate = await Challenge.findById(req.body._id)
    const completionOn = moment().add(challange_to_activate.time_to_complete, 'minutes').toDate();
    const challange_is_activate = await Challenge.findByIdAndUpdate(req.body._id, { status : "ongoing", completion_on : completionOn })
    const response = {
        "activated" : true
    }
    res.status(200).send(response)
})
