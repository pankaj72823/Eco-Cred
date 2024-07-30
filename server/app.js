import express from 'express'
import mongoose from 'mongoose';
import './config/passport.js'
import { authRouter } from './Router/authRouter.js';

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

//MongoDB Connection 
async function main() {
    await mongoose.connect("mongodb://127.0.0.1:27017/Eco-Cred");
  }
  main()
    .then((res) => {
      console.log("Connected to Database ");
    })
    .catch((err) => {
      console.log(err);
});
  

app.use('/auth' ,authRouter)

app.get('/',(req,res)=>{
    res.send("Hello")
})

app.listen(5050, () => {
    console.log("Click to Connect : http://localhost:5050/");
});