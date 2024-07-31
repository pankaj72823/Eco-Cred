import { Question } from './Models/Quetions.js';
import {dummydata,questions} from './Utils/dummyData.js';
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
    const stored =await Question.insertMany(questions)
    console.log("intialization Completed")
}

startup()