import User from "../Models/User.js"
import jwt from 'jsonwebtoken'
import wrapAsync from "../Utils/wrapAsync.js"
import Reward from "../Models/Rewards.js"
const jwtSecret = "EcoCred#Carbon@X"

export const signup =wrapAsync( async(req,res)=>{
    const {username}=req.body
    const existingUser = await User.findOne({username})
    if(existingUser){
        return res.status(400).json({message:`User Already Exists`})
    }
    const easyReward = await Reward.findOne({ difficulty: "easy", level: 1 });
    const mediumReward = await Reward.findOne({ difficulty: "medium", level: 1 });
    const hardReward = await Reward.findOne({ difficulty: "hard", level: 1 });

    const newUser = new User(req.body)
    newUser.rewards_upcoming.easy = easyReward ? easyReward._id : null;
    newUser.rewards_upcoming.medium = mediumReward ? mediumReward._id : null;
    newUser.rewards_upcoming.hard = hardReward ? hardReward._id : null;
    const regUser = await newUser.save();
    const token = jwt.sign({ sub: regUser._id }, jwtSecret, { expiresIn: '1d' });
    res.status(200).json({ token,...regUser._doc }); 
  }
)

export const login = wrapAsync(async(req,res)=>{
    const {username, password} =req.body
    const user = await User.findOne({username})
    if(!user){
        return res.status(401).json({ message: 'Invalid username or password' });
    }
    user.comparePassword(password, (err, isMatch) => {
        if (err) return res.status(500).json({ message: 'Internal server error' });
        if (!isMatch) return res.status(401).json({ message: 'Invalid username or password' });

        const token = jwt.sign({ sub: user._id }, jwtSecret, { expiresIn: '1d' });
        res.status(200).json({ token, ...user._doc });
      });
})