import express from 'express'
import wrapAsync from '../Utils/wrapAsync.js';
import { Question } from '../Models/Quetions.js';

const router = express.Router();

router.get('/',wrapAsync(async(req,res)=>{
    const questions = await Question.find();
    const response = [];
    for (const question of questions) {
        response.push({
            category : question.category,
            question : question.question,
            options : question.options
        })
    }
    res.status(200).send(response)
}))

export {router as questionRouter}