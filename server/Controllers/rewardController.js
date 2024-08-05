import User from "../Models/User.js";
import wrapAsync from "../Utils/wrapAsync.js";
import  jwt from "jsonwebtoken";
import mongoose from "mongoose";
const jwtSecret = "EcoCred#Carbon@X"

export const reward = wrapAsync(async(req,res)=>{
   let userId;
   const decoded = jwt.verify(req.body.token, jwtSecret,(err, decoded) => {
    if (err) {
        return res.status(401).send('Invalid token');
    }
    else{
        userId = decoded.sub
    }
})
    const data = await User.findById(userId)
    .populate('rewards_completed.easy')
    .populate('rewards_completed.medium')
    .populate('rewards_completed.hard')
    .populate('rewards_upcoming.easy')
    .populate('rewards_upcoming.medium')
    .populate('rewards_upcoming.hard')
    .exec();
    const response = {
        "rewards_completed": {
            "easy" : data.rewards_completed.easy,
            "medium" : data.rewards_completed.medium,
            "hard" : data.rewards_completed.hard,
        },
        "upcoming_reward": {
          "easy" : data.rewards_upcoming.easy,
          "medium" : data.rewards_upcoming.medium,
         "hard" : data.rewards_upcoming.hard,
        }
      }
    res.send(response)
})