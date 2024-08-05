import Product from './Models/Product.js';
import Project from './Models/Project.js';
import { Question } from './Models/Quetions.js';
import Reward from './Models/Rewards.js';
import {dummydata,questions,rewards,product,projects} from './Utils/dummyData.js';
import './config/mongodb.js'
import axios from 'axios';

const startup =async()=>{
    const url = 'http://localhost:5050/auth/signup';
    try {
        const response = await axios.post(url, dummydata);
        console.log(response.data);
    } catch (error) {
        console.error('Error calling the route:', error);
    }
    await Question.insertMany(questions)
    await Reward.insertMany(rewards)
    await Product.insertMany(product)
    await Project.insertMany(projects)
    console.log("intialization Completed")
}

startup()