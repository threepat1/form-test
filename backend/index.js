const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.json());


const mongoDB = 'mongodb://localhost:27017/profile_db';
main().catch((err) => console.log(err));
async function main() {
  await mongoose.connect(mongoDB);
}
const ProfileSchema = new mongoose.Schema({
    email: String,
    password: String,
    gender: String,
    pincode: String,
    address: String,
    city: String,
    state: String,
    country: String,
    accountNo: String,
    accountHolder: String,
    ifsccode: String,
});

const Profile = mongoose.model('Profile',ProfileSchema);

app.post('/save-profile',async (req,res) => {
    try{
        const newProfile = new Profile(req.body);
        await newProfile.save();
        res.status(201).json({message: 'Save Successfully'});
    } catch (error) {
        res.status(500).json({message: 'Error'});
    }
});



app.listen(3000,() =>{
    console.log('Server is running on port 3000');
});