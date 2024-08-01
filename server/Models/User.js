import mongoose from "mongoose";
import bcrypt from 'bcryptjs'
const Schema = mongoose.Schema;

const userSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true,
        unique: true
    },
    phone_number: {
        type: Number,
        required: true
    },
    username: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true
    },
    gender: {
        type: String,
        required: true
    },
    profession: {
        type: String,
        required: true
    },
    why_EcoCred: {
        type: String,
        required: true
    },
    preferences: {
        type: [String],
    },
    carbon_footprint: {
        transportation: {
            type: Number,
            default: 0
        },
        home_energy_use: {
            type: Number,
            default: 0
        },
        diet: {
            type: Number,
            default: 0
        },
        waste_management: {
            type: Number,
            default: 0
        },
        total: {
            type: Number,
            default: 0
        },
        suggestions: {
            type: [String],
            default: null
        },
        last_tracked : {
            type : String,
            default : Date.now()
        }
    },
    badges: {
        type: Number,
        default: 0
    },
    challangeId: { type: Schema.Types.ObjectId, ref: 'Challange'},
    fav_product_Id :{ type: Schema.Types.ObjectId, ref: 'Product'},
    fav_project_Id :{ type: Schema.Types.ObjectId, ref: 'Project'},
});

userSchema.pre('save', function (next) {
    if (!this.isModified('password')) return next();

    bcrypt.hash(this.password, 10, (err, hashedPassword) => {
        if (err) return next(err);
        this.password = hashedPassword;
        next();
    });
});

userSchema.methods.comparePassword = function (candidatePassword, cb) {
    bcrypt.compare(candidatePassword, this.password, (err, isMatch) => {
        if (err) return cb(err);
        cb(null, isMatch);
    });
};

const User = new mongoose.model("User", userSchema)

export default User