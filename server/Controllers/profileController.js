import User from "../Models/User.js";
import wrapAsync from "../Utils/wrapAsync.js";
import jwt from 'jsonwebtoken'
const jwtSecret = "EcoCred#Carbon@X"

export const profile = wrapAsync(async(req,res)=>{
    const token = req.body.token
    let userId
    jwt.verify(token, jwtSecret, (err, decoded) => {
        if (err) {
            return res.status(401).send('Invalid token');
        }
        else{
            userId = decoded.sub
        }
    })
    const user = await User.findById(userId)
    .populate('rewards_completed.easy')
    .populate('rewards_completed.medium')
    .populate('rewards_completed.hard')
    .populate('rewards_upcoming.easy')
    .populate('rewards_upcoming.medium')
    .populate('rewards_upcoming.hard')
    .exec();
    const response = {
        name : user.name,
        profile : {
            name : user.name,
            email : user.email,
            phone_number : user.phone_number,
            levels : user.levels,
            gender : user.gender,
            profession : user.profession,
        },
        carbon_footprint : user.carbon_footprint,
        achievement : {
                easy : user.rewards_completed.easy,
                medium : user.rewards_completed.medium,
                hard : user.rewards_completed.hard,
            }

    }
    res.status(200).send(response)
})