import wrapAsync from "../Utils/wrapAsync.js";

export const challenge = wrapAsync(async(req,res)=>{
    res.send('challenge')
})