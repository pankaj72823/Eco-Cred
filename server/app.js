import express from 'express'
import './config/passport.js'
import './config/mongodb.js'
import { authRouter } from './Router/authRouter.js';
import { initRouter } from './Router/initRouter.js';

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

app.use('/init',initRouter)

app.listen(5050, () => {
    console.log("Click to Connect : http://localhost:5050/");
});