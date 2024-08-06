import mongoose, { model } from 'mongoose';
const { Schema } = mongoose;

const rewardSchema = new Schema({
  difficulty: {
    type: String,
    required: true,
    enum: ['easy', 'medium', 'hard']
  },
  level: {
    type: Number,
    required: true,
    min: 1,
    max: 3
  },
  reward: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required : true
  },
  file: {
    type: String,
    required : true
  }
});

const Reward = model('Reward', rewardSchema);

export default Reward;