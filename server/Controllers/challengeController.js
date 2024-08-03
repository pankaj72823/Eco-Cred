import wrapAsync from "../Utils/wrapAsync.js";
import { Answer } from "../Models/Quetions.js";
import jwt from "jsonwebtoken";
import { genAI } from "../app.js";
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
    "easy": {
        "category": "string",
        "challenge": "string",
        "reason": "string",
        "time_to_complete": "in Numbers only unit is minutes", //unit is in minutes currently we will update it to days at the last stage
        "difficult": "easy"
    },
    "medium": {
        "category": "string",
        "challenge": "string",
        "reason": "string",
        "time_to_complete": "in Numbers only unit is minutes",
        "difficult": "medium"
    },
    "hard": {
        "category":"string",
        "challenge": "string",
        "reason": "string",
        "time_to_complete": "in Numbers only unit is minutes",
        "difficult": "hard"
    }
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
                const message = `Generate personalized challenges to help the user improve their carbon credits. The challenges should be categorized as easy, medium, and hard, with varying rewards in the form of badges. Each challenge should include the category, challenge, reason, time to complete, and rewards. Use the provided user data to tailor exactly 3 challenges as individual objects (not in an array), ensuring the categories are shuffled (not sequential). data = ${JSON.stringify(data)}, format = ${JSON.stringify(format)}`
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
    const answers = await Answer.find({ userId }).populate('questionId').exec();
    let detailAnswere=[]
    for (const answer of answers) {
        detailAnswere.push({
            category : answer.questionId.category,
            question : answer.questionId.question,
            answer : answer.answer
        })
    }
    const result =await run(detailAnswere)
    res.status(200).send(result)
})