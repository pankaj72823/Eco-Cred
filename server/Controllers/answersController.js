import wrapAsync from "../Utils/wrapAsync.js";
import { Question, Answer } from "../Models/Quetions.js";

export const answers =wrapAsync (async(req,res)=>{
    const userAnswers = req.body
    for(const userAnswer of userAnswer){
        const question = await Question.findOne({quetions: userAnswer.quetion})
        if (question) {
            const answer = new Answer({
              userId,
              questionId: question._id,
              answer: userAnswer.answer
            });
            await answer.save();
        }
    }
    console.log('User answers saved successfully');
    res.send("answere")
})

export const result = wrapAsync(async(req,res)=>{
    res.send("result")
})