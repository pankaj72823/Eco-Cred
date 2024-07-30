import User from './Models/User.js';
import dummydata from './Utils/dummyData.js';
import './config/mongodb.js'

const startup =async()=>{
    const stored = await User.insertMany(dummydata);
    console.log(stored)
}

startup()