import { genAI } from '../app.js';
import express from 'express'
import readline from 'readline';
import wrapAsync from "../Utils/wrapAsync.js";
import jwt from "jsonwebtoken"
import { Answer } from "../Models/Quetions.js";
import User from '../Models/User.js';
const jwtSecret = "EcoCred#Carbon@X"


const r1 = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
})


function extractAllCurlyBracesSubstrings(inputString) {
    const singleLineString = inputString.replace(/[\r\n]+/g, ' ').trim();
    const regex = /\{.*?\}/;
    const match = singleLineString.match(regex);
    if (match) {
        const jsonString = match[0];
        try {
        const jsonObject = JSON.parse(jsonString);
        return jsonObject
        } catch (error) {
           return JSON.parse('{"message" :"error" }')
        }
    } else {
        return JSON.parse('{"message" :"error" }')   
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
                const message = `I will provide you with JSON data containing various categories. Your task is to calculate the carbon footprint for each category based on this data and also provide suggestions. Additionally, calculate the percentage of the total carbon footprint that each category represents, ensuring that the sum of all percentages equals 100%. The result should be as accurate as possible, but an approximate value is acceptable. Please ensure that your response is formatted according to the structure provided in the following format: ${JSON.stringify(format)} and no string allowed as an answer write answer in Numbers unit is tons of CO2. Here is the JSON data: ${JSON.stringify(data)}`
                const result = await chat.sendMessage(message);
                const response = await result.response
                const text = response.text();
                console.log(text)
                console.log(extractAllCurlyBracesSubstrings(text))
                return extractAllCurlyBracesSubstrings(text);
            }

    return await askAndRespond();
}

const format = 
   {
      "transportation": "",
      "transportation_percentage": "",
      "home_energy_use": "",
      "home_energy_use_percentage": "",
      "diet": "",
      "diet_percentage": "",
      "waste_management": "",
      "waste_management_percentage": "",
      "total": "" ,
      "suggestions" : "Array Of only 5 Strings not more"
    }


export const result = wrapAsync(async(req,res)=>{
    const {token} = req.body
    let userId;
    jwt.verify(token, jwtSecret, (err, decoded) => {
        if (err) {
            return res.status(401).send('Invalid token');
        }
        else{
            console.log(decoded)
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
    console.log(detailAnswere)
    const result =await run(detailAnswere)
    let currentTimestamp = Date.now();
    let currentDate = new Date(currentTimestamp);
    const updatedCarbonFootprint = {
        'carbon_footprint.transportation': result.transportation,
        'carbon_footprint.home_energy_use': result.home_energy_use,
        'carbon_footprint.diet': result.diet,
        'carbon_footprint.waste_management': result.waste_management,
        'carbon_footprint.total': result.total,
        'carbon_footprint.suggestions': result.suggestions,
        'carbon_footprint.last_tracked': currentDate.toLocaleString()
      };
    console.log(updatedCarbonFootprint)
    const updatedUser = await User.updateOne({ _id: userId }, { $set: updatedCarbonFootprint });
    res.status(200).send(result)
})