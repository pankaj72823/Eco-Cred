import { Schema, model } from 'mongoose';

const challengeSchema = new Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    category: {
        type: String,
        required: true
    },
    challenge: {
        type: String,
        required: true
    },
    time_to_complete: {
        type: Number,
        required: true
    },
    difficulty: {
        type: String,
        required: true,
        enum: ['easy', 'medium', 'hard']
    },
    status: {
        type: String,
        required: true,
        enum: ['ongoing', 'completed','available','blocked'],
        default: 'available'
    },
    completion_on: {
        type: Date
    }
});

const Challenge = model('Challenge', challengeSchema);

export default Challenge;
