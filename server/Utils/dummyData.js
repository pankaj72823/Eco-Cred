const dummydata =
    {
        "name": "Alice Smith",
        "email": "alice.smith@example.com",
        "phone_number": 9123456789,
        "username": "alicesmith",
        "password": "mypassword456",
        "gender": "Female",
        "profession": "Graphic Designer",
        "why_EcoCred": "To make a positive impact on the environment",
    }

const questions = [
    {
        "category": "transportation",
        "question": "How do you usually commute to work or school?",
        "options": ["Car", "Bus", "Train", "Bicycle", "Walking", "Other"],
    },
    {
        "category": "transportation",
        "question": "How many kilometers do you drive per day?",
        "options": [],
        "answer": "200"
    },
    {
        "category": "transportation",
        "question": "How often do you use public transport per week?",
        "options": ["Bus", "Train", "Subway"],
        "answer": "Bus"
    },
    {
        "category": "transportation",
        "question": "How many kilometers do you travel using public transport per day?",
        "options": [],
        "answer": "100"
    },
    {
        "category": "transportation",
        "question": "How many flights do you take per year?",
        "options": [],
        "answer": "10"
    },
    {
        "category": "home_energy_use",
        "question": "How many people live in your household?",
        "options": [],
        "answer": "40"
    },
    {
        "category": "home_energy_use",
        "question": "What is your average consumption of electricity in a month? (kilowatt-hour(kWh)/month)",
        "options": [],
        "answer": "1000"
    },
    {
        "category": "home_energy_use",
        "question": "What is your primary source of electricity?",
        "options": ["Coal", "Natural Gas", "Solar", "Wind", "Hydro", "Other"],
        "answer": "Natural Gas"
    },
    {
        "category": "home_energy_use",
        "question": "What is your primary source of Cooking?",
        "options": ["Natural Gas", "Electricity", "Wood", "Other"],
        "answer": "Electricity"
    },
    {
        "category": "home_energy_use",
        "question": "How often do you use air conditioning?",
        "options": ["Never", "Occasionally", "Regularly", "Always"],
        "answer": "Regularly"
    },
    {
        "category": "diet",
        "question": "How often do you consume meat?",
        "options": ["Daily", "Several times a week", "Weekly", "Rarely", "Never"],
        "answer": "Daily"
    },
    {
        "category": "diet",
        "question": "How often do you consume locally sourced food?",
        "options": ["Daily", "Several times a week", "Weekly", "Rarely", "Never"],
        "answer": "Weekly"
    },
    {
        "category": "diet",
        "question": "How often do you eat out at restaurants or order takeout?",
        "options": ["Daily", "Several times a week", "Weekly", "Rarely", "Never"],
        "answer": "Weekly"
    },
    {
        "category": "diet",
        "question": "Do you try to minimize food waste?",
        "options": ["Always", "Usually", "Sometimes", "Rarely", "Never"],
        "answer": "Usually"
    },
    {
        "category": "waste_management",
        "question": "Do you recycle regularly?",
        "options": ["Always", "Usually", "Sometimes", "Rarely", "Never"],
        "answer": "Always"
    },
    {
        "category": "waste_management",
        "question": "What percentage of your waste is recycled?",
        "options": [],
        "answer": "50%"
    },
    {
        "category": "waste_management",
        "question": "How many bags of trash does your household produce per week?",
        "options": [],
        "answer": "3"
    },
    {
        "category": "waste_management",
        "question": "Do you compost organic waste?",
        "options": ["Always", "Usually", "Sometimes", "Rarely", "Never"],
        "answer": "Sometimes"
    },
    {
        "category": "miscellaneous",
        "question": "Do you try to buy eco-friendly or sustainable products?",
        "options": ["Always", "Usually", "Sometimes", "Rarely", "Never"],
        "answer": "Usually"
    }
]

export {dummydata,questions}