import wrapAsync from "../Utils/wrapAsync.js";
import jwt from "jsonwebtoken"
import { Question, Answer } from "../Models/Quetions.js";
import axios from "axios";
const jwtSecret = "EcoCred#Carbon@X"

export const answers =wrapAsync (async(req,res)=>{
    const {token , data} = req.body
    let userId;
    jwt.verify(token, jwtSecret, (err, decoded) => {
        if (err) {
            return res.status(401).send('Invalid token');
        }
        else{
            userId = decoded.sub
        }
    })
    for (const userAnswer of data) {
        const question = await Question.findOne({ question: userAnswer.question });
        if (question) {
            const answer = new Answer({
                userId,
                questionId: question._id,
                answer: userAnswer.answer
            });
            await answer.save();
        }
    }
    const url = 'http://localhost:5050/answers/result';
    try {
        const response = await axios.post(url, {token});
        res.send(response.data)
    } catch (error) {
        console.error('Error calling the route:', error);
        res.send("error")
    }
})

