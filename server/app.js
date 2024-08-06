import dotenv from "dotenv";
import express from 'express'
import './config/passport.js'
import './config/mongodb.js'
import './config/cron.js'
import { authRouter } from './Router/authRouter.js';
import { answersRouter } from './Router/answersRouter.js';
import { questionRouter } from './Router/questionRouter.js';
import {activateRouter} from './Router/activateRouter.js'
import {challengeRouter} from './Router/challengeRouter.js'
import {rewardRouter} from './Router/rewardRouter.js' 
import {profileRouter} from './Router/profileRouter.js' 
import {projectRouter} from './Router/projectRouter.js' 
import {productRouter} from './Router/productRouter.js' 
import { GoogleGenerativeAI } from "@google/generative-ai";
import { rewards } from "./Utils/dummyData.js";
dotenv.config();
export const genAI = new GoogleGenerativeAI("AIzaSyC_-cPbqy6Y-HCvb5myQWhcUbSP2BnXmAI")
const app = express();
app.use(express.urlencoded({ extended: true }))
app.use(express.json())
const PORT = 5050;

//Logger MiddelWare to Fetch Requests
app.use((req, res, next) => {
  const Logtime = new Date(Date.now());
  if(req.path != "/appIcon.ico"){
  console.log(
    `Method : ${req.method} \n Path : ${req.path} \n Time : ${Logtime} \n`
  )}
  next();
});
  

app.use('/auth' ,authRouter)

app.use('/question' ,questionRouter)
app.use('/answers',answersRouter)
app.use('/challenges', challengeRouter)
app.use('/activate', activateRouter)
app.use('/reward', rewardRouter)
app.use('/profile', profileRouter)
app.use('/projects', projectRouter)
app.use('/products', productRouter)

app.listen(5050, () => {
    console.log("Click to Connect : http://localhost:5050/");
});