import mongoose from "mongoose";
const Schema = mongoose.Schema;

const questionSchema = new Schema({
  category: { type: String, required: true },
  question: { type: String, required: true },
  options: [String] 
});

const answerSchema = new Schema({
  userId: { type: Schema.Types.ObjectId, ref: 'User', required: true },
  questionId: { type: Schema.Types.ObjectId, ref: 'Question', required: true },
  answer: { type: String, required: true }
});


export const Question =new mongoose.model('Question', questionSchema);
export const Answer = new mongoose.model('Answer', answerSchema);

