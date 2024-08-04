import wrapAsync from "../Utils/wrapAsync.js";
import { Answer } from "../Models/Quetions.js";
import jwt from "jsonwebtoken";
import { genAI } from "../app.js";
import Challenge from "../Models/Challange.js";
import mongoose from "mongoose";
const jwtSecret = "EcoCred#Carbon@X"


function extractAllCurlyBracesSubstrings(inputString) {
    const startIndex = inputString.indexOf('{');
    const endIndex = inputString.lastIndexOf('}') + 1;
    const jsonString = inputString.substring(startIndex, endIndex);
    
    try {
        const jsonData = JSON.parse(jsonString);
        return jsonData
    } catch (error) {
        return JSON.parse('{"message" :"error" }');
    }
}

const format = {
    "challenges": [
        {
            "category": "string",
            "challenge": "string",
            "time_to_complete": "in Numbers only unit is Minutes",
            "difficulty": "easy"
        },
        {
            "category": "string",
            "challenge": "string",
            "time_to_complete": "in Numbers only unit is Minutes",
            "difficulty": "easy"
        },
        {
            "category": "string",
            "challenge": "string",
            "time_to_complete": "in Numbers only unit is Minutes",
            "difficulty": "easy"
        },
        {
           "category": "string",
            "challenge": "string",
            "time_to_complete": "in Numbers only unit is Minutes",
            "difficulty": "medium"
        },
        {
           "category": "string",
            "challenge": "string",
            "time_to_complete": "in Numbers only unit is Minutes",
            "difficulty": "medium"
        },
        {
           "category": "string",
            "challenge": "string",
            "time_to_complete": "in Numbers only unit is Minutes",
            "difficulty": "medium"
        },
        {
           "category": "string",
            "challenge": "string",
            "time_to_complete": "in Numbers only unit is Minutes",
            "difficulty": "hard"
        },
        {
            "category": "string",
            "challenge": "string",
            "time_to_complete": "in Numbers only unit is Minutes",
            "difficulty": "hard"
        },
        {
            "category": "string",
            "challenge": "string",
            "time_to_complete": "in Numbers only unit is Minutes",
            "difficulty": "hard"
        }
    ]
}

async function run(data){
    const model = genAI.getGenerativeModel({model: "gemini-1.5-flash"});
    const chat = model.startChat({
        history:[{
            role : 'user',
            parts : [{text : "Please provide your responses in JSON format only. Ensure the JSON is well-formed and includes the necessary fields. For example, if asked about a topic, respond with a JSON object that includes fields such as 'response' and 'details'"}]
        }],
        generationConfig : {
            maxOutputTokens: 100000,
        }   
    })
    async function askAndRespond(){
                const message = `Generate personalized challenges to help the user improve their carbon credits. Each difficulty level (easy, medium, hard) should have exactly 3 challenges. Ensure that the categories are shuffled and not sequential. Each challenge should include the category, challenge, time to complete, and rewards. Use the provided user data to tailor the challenges. The output should be include 3 challanges for easy,medium and hard. Total of 9 challanges. Data = ${JSON.stringify(data)}, format = ${JSON.stringify(format)}.`
                const result = await chat.sendMessage(message);
                const response = await result.response
                const text = response.text();
                return extractAllCurlyBracesSubstrings(text);
            }

    return await askAndRespond();
}

export const challenge = wrapAsync(async(req,res)=>{
    const {token} = req.body
    let userId;
    jwt.verify(token, jwtSecret, (err, decoded) => {
        if (err) {
            return res.status(401).send('Invalid token');
        }
        else{
            userId = decoded.sub
        }
    })
    const result = await Challenge.find({userId : userId, status : "available"})
    console.log(result)
    if(result.length > 0){
    res.status(200).send(result)
} else {
    const answers = await Answer.find({ userId }).populate('questionId').exec();
    let detailAnswere=[]
    for (const answer of answers) {
        detailAnswere.push({
            category : answer.questionId.category,
            question : answer.questionId.question,
            answer : answer.answer
        })
    }
    const array =await run(detailAnswere)
    array.challenges.forEach(async(challenge) => {
       const newChallenge = new Challenge({
       userId: new mongoose.Types.ObjectId(userId),
       category: challenge.category,
       challenge: challenge.challenge,
       reason: challenge.reason,
       time_to_complete: challenge.time_to_complete,
       difficulty: challenge.difficulty,
     });
    await newChallenge.save();
    });
    const newResult = await Challenge.find({userId : userId, status : "available"})
    res.status(200).send(newResult)
}
})