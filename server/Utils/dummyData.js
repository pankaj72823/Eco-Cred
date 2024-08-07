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

const rewards =[
    {
      "difficulty": "easy",
      "level": 1,
      "reward": "🏅 Green Commute Champion Badge",
      "description": "Earn the prestigious Green Commute Champion Badge! Flaunt your dedication to a greener world.",
      "file": "https://drive.google.com/file/d/1bmM0I9R83vUj_z67A_-umrIQ1_d-i8-g/view?usp=drive_link"
    },
    {
      "difficulty": "easy",
      "level": 2,
      "reward": "💸 5% Discount on Eco-Friendly Products",
      "description": "Enjoy a 5% discount on eco-friendly products. Save money while saving the planet!",
      "file": "https://drive.google.com/file/d/1e2OtdXnycne7BjXNSE39bBXVhS_OF_oV/view?usp=drive_link"
    },
    {
      "difficulty": "easy",
      "level": 3,
      "reward": "🛍️ Premium Set of Reusable Eco-Friendly Bags",
      "description": "Receive a stylish premium set of reusable eco-friendly bags. Carry your groceries sustainably and in style.",
      "file": "https://drive.google.com/file/d/1HH1DtzoNhotSKmUi1hEueztUl0hRoRdJ/view?usp=drive_link"
    },
    {
      "difficulty": "medium",
      "level": 1,
      "reward": "🌍 Planet Friendly Warrior Badge",
      "description": "Become a Planet Friendly Warrior! Wear this badge with pride and inspire others.",
      "file": "https://drive.google.com/file/d/1Ezu870cJjIO04hMjYXV0z4l6hgM61_wJ/view?usp=drive_link"
    },
    {
      "difficulty": "medium",
      "level": 2,
      "reward": "📜 Eco-Cred Excellence Certificate",
      "description": "Earn the exclusive Eco-Cred Excellence Certificate. Celebrate your outstanding contributions to sustainability.",
      "file": "https://drive.google.com/file/d/1oKYR81DaiFKNLnrp769V_z7kMo4YMyAM/view?usp=drive_link"
    },
    {
      "difficulty": "medium",
      "level": 3,
      "reward": "💚 Honorary Donation to Environmental NGO",
      "description": "Make a lasting impact! We will donate to an environmental NGO in your honor.",
      "file": "https://drive.google.com/file/d/18QKnANjnAHbNvz-mdJq4I3mO6dLywMI3/view?usp=drive_link"
    },
    {
      "difficulty": "hard",
      "level": 1,
      "reward": "💰 25% Discount on All Eco Products",
      "description": "Get a 25% discount on all eco-friendly products! Shop more, save more, and lead a greener lifestyle.",
      "file": "https://drive.google.com/file/d/1YknvRl0a3HFEfjZzrU99lI6hbwdAdK5B/view?usp=drive_link"
    },
    {
      "difficulty": "hard",
      "level": 2,
      "reward": "🌱 Tree Plantation in Your Honor",
      "description": "Contribute to a greener world! We will plant a tree in your honor and provide a certificate.",
      "file": "https://drive.google.com/file/d/1DJIrX8nv49aeFwzskkmJJDqRFobdWy2D/view?usp=drive_link"
    },
    {
      "difficulty": "hard",
      "level": 3,
      "reward": "🏆 Leader Board Recognition",
      "description": "Achieve Leader Board Recognition! Be celebrated as a top contributor to environmental sustainability.",
      "file": "https://drive.google.com/file/d/1-VuTWUnuW4x3WAInFVvlKATfwjhTQVAR/view?usp=drive_link"
    }
  ]
  
const projects = [
    {
      "name": "Terrapass",
      "description": "Terrapass offers projects for reducing carbon footprints via renewable energy and methane capture.",
      "organization": "Terrapass",
      "project_type": ["Reforestation", "Methane Capture"],
      "impact": "Each 1,000 lbs of carbon offsets destroys 1,000 lbs of greenhouse gases.",
      "file": "https://drive.google.com/file/d/1Xb65lh_AA66Md839xNAPfN6JOHNByv2n/view?usp=drive_link" 

    },
    {
      "name": "Atmosfair",
      "description": "Atmosfair specializes in offsetting carbon emissions from air travel with impactful projects.",
      "organization": "Atmosfair",
      "project_type": ["BioGas", "Solar Energy", "Hydro Power"],
      "impact": "Funds go to various projects offsetting emissions from air travel.",
      "file":"https://drive.google.com/file/d/18V7sCeQtGt-LdE1pLPo7U-apQbrRIKHV/view?usp=drive_link"
    },
    {
      "name": "Myclimate",
      "description": "Myclimate aligns projects with UN SDGs, covering areas like hydropower and water purification.",
      "organization": "Myclimate",
      "project_type": ["Hydropower", "Energy Efficiency", "Land Improvement", "Water Purification"],
      "impact": "Projects in Ethiopia, India, Togo, Benin, Solomon Islands, etc.",
      "file" : "https://drive.google.com/file/d/1RCVCeGbo9RBDJSl35uQRQzRaCCY9x_hO/view?usp=drive_link"
    },
    {
      "name": "Carbon Checkout",
      "description": "Carbon Checkout integrates carbon offsetting into online shopping with a unique widget for project selection.",
      "organization": "Carbon Checkout",
      "project_type": ["Blended Impact", "Protect Nature", "Safeguard our Oceans", "Preserve Biodiversity", "Transition to Renewable Energy"],
      "impact": "Focuses on investing in nature-based solutions and renewable energy.",
      "file" : "https://drive.google.com/file/d/1X2k84nhkwAjxd-YXySpX86YDNO27574W/view?usp=drive_link"
    }
  ]
  

const product = [
    {
    "category": "General Store Items",
     "brand": "Skoy",
     "product": "Best Reusable Sponge Cloth",
     "description": "Swedish dishcloths that are an eco-friendly alternative to paper towels and sponges, reusable for washing dishes or cleaning spills.",
     "carbon_reduce": 100,
     "file" : "https://drive.google.com/file/d/1GQ0yOvzUmpLpIHJVhdUpq-xyQ_qSGQh_/view?usp=drive_link"
    },
    {
      "category": "Cosmetics",
      "brand": "Aveeno",
      "product": "Aveeno Soothing Bath Treatment",
      "description": "A bath treatment made of 100% pure colloidal oatmeal that relieves itchy skin and is sustainably sourced with an eco-friendly manufacturing process.",
      "carbon_reduce": 50,
     "file" : "https://drive.google.com/file/d/1d1Nr-n1Aqnmicm6WakIQ9e12Zy3axRwz/view?usp=drive_link"
    }
    ,    
    {
      "category": "General Store Items",
      "brand": "Baggu",
      "product": "Baggu Standard Reusable Shopping Bags (3 Pack)",
      "description": "Lightweight, compact reusable shopping bags in fun patterns and colors, perfect for avoiding single-use plastic bags.",
      "price": "$42 at BAGGU",
      "carbon_reduce": 60,
     "file" : "https://drive.google.com/file/d/1wBHNwQzF1_OMqn5bF7ikkT4_Phi_Mi51/view?usp=drive_link"
    },    
    {
      "category": "Home Care Items",
      "brand": "Norm",
      "product": "Sustainable Sneakers and T-Shirts",
      "description": "Norm produces sneakers made from 90% recycled materials and organic and recycled cotton t-shirts, with a take-back program for recycling used sneakers.",
      "carbon_reduce": 20,
     "file" : "https://drive.google.com/file/d/1-zwCUgi_l7ohp8WZyh2c2gHXEPAdILeJ/view?usp=drive_link"
    },    
    {
      "category": "Cosmetics",
      "brand": "Tsuno",
      "product": "Sustainable Tampons",
      "description": "Tampons made from bleach-free organic cotton, with each box sold supporting girls' education in Sierra Leone and Uganda.",
      "carbon_reduce": 40,
     "file" : "https://drive.google.com/file/d/1B0-WD_sj8Qe_X2ZIQ4Th9murCEMhljVC/view?usp=drive_link"
    },
    {
      "category": "Home Care Items",
      "brand": "Flip & Tumble",
      "product": "Eco-Friendly Product Bags",
      "description": "Reusable eco-friendly bags that fit into the pockets of the brand’s collapsible tote bags, offering a sustainable alternative to plastic.",
      "carbon_reduce": 10,
     "file" : "https://drive.google.com/file/d/1SbUnnEMC6W4FbUVmZkPmqfvOnPPBNU2g/view?usp=drive_link"
    }, 
    {
      "category": "Cosmetics",
      "brand": "joy",
      "product": "The Right to Shower Joy Shampoo",
      "description": "Best Sustainable Shampoo/Soap Combo",
      "carbon_reduce": 100,
     "file" : "https://drive.google.com/file/d/1Y0RbG4IVfGAkPPEPc_SaUoKzlGBCGxIE/view?usp=drive_link"
    }    
  ]
  
export {dummydata,questions,rewards,projects,product}