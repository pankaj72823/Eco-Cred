import mongoose from 'mongoose';


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