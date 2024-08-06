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
      "file": "green_commute_badge.jpeg"
    },
    {
      "difficulty": "easy",
      "level": 2,
      "reward": "💸 5% Discount on Eco-Friendly Products",
      "description": "Enjoy a 5% discount on eco-friendly products. Save money while saving the planet!",
      "file": "5_percent_discount_coupon.jpeg"
    },
    {
      "difficulty": "easy",
      "level": 3,
      "reward": "🛍️ Premium Set of Reusable Eco-Friendly Bags",
      "description": "Receive a stylish premium set of reusable eco-friendly bags. Carry your groceries sustainably and in style.",
      "file": "order_summary.jpeg"
    },
    {
      "difficulty": "medium",
      "level": 1,
      "reward": "🌍 Planet Friendly Warrior Badge",
      "description": "Become a Planet Friendly Warrior! Wear this badge with pride and inspire others.",
      "file": "planet_friendly_warrior_badge.jpeg"
    },
    {
      "difficulty": "medium",
      "level": 2,
      "reward": "📜 Eco-Cred Excellence Certificate",
      "description": "Earn the exclusive Eco-Cred Excellence Certificate. Celebrate your outstanding contributions to sustainability.",
      "file": "eco_cred_certificate.pdf"
    },
    {
      "difficulty": "medium",
      "level": 3,
      "reward": "💚 Honorary Donation to Environmental NGO",
      "description": "Make a lasting impact! We will donate to an environmental NGO in your honor.",
      "file": "donation_cerificate.jpeg"
    },
    {
      "difficulty": "hard",
      "level": 1,
      "reward": "💰 25% Discount on All Eco Products",
      "description": "Get a 25% discount on all eco-friendly products! Shop more, save more, and lead a greener lifestyle.",
      "file": "25_percent_discount_coupon.jpeg"
    },
    {
      "difficulty": "hard",
      "level": 2,
      "reward": "🌱 Tree Plantation in Your Honor",
      "description": "Contribute to a greener world! We will plant a tree in your honor and provide a certificate.",
      "file": "tree_plantation_certificate.pdf"
    },
    {
      "difficulty": "hard",
      "level": 3,
      "reward": "🏆 Leader Board Recognition",
      "description": "Achieve Leader Board Recognition! Be celebrated as a top contributor to environmental sustainability.",
      "file": "leader_board_name_recognition.jpeg"
    }
  ]
  
const projects = [
    {
      "name": "Terrapass",
      "description": "Terrapass offers projects for reducing carbon footprints via renewable energy and methane capture.",
      "organization": "Terrapass",
      "project_type": ["Reforestation", "Methane Capture"],
      "impact": "Each 1,000 lbs of carbon offsets destroys 1,000 lbs of greenhouse gases."
    },
    {
      "name": "Atmosfair",
      "description": "Atmosfair specializes in offsetting carbon emissions from air travel with impactful projects.",
      "organization": "Atmosfair",
      "project_type": ["BioGas", "Solar Energy", "Hydro Power"],
      "impact": "Funds go to various projects offsetting emissions from air travel."
    },
    {
      "name": "Myclimate",
      "description": "Myclimate aligns projects with UN SDGs, covering areas like hydropower and water purification.",
      "organization": "Myclimate",
      "project_type": ["Hydropower", "Energy Efficiency", "Land Improvement", "Water Purification"],
      "impact": "Projects in Ethiopia, India, Togo, Benin, Solomon Islands, etc."
    },
    {
      "name": "Carbon Checkout",
      "description": "Carbon Checkout integrates carbon offsetting into online shopping with a unique widget for project selection.",
      "organization": "Carbon Checkout",
      "project_type": ["Blended Impact", "Protect Nature", "Safeguard our Oceans", "Preserve Biodiversity", "Transition to Renewable Energy"],
      "impact": "Focuses on investing in nature-based solutions and renewable energy."
    }
  ]
  

const product = [
    {
      "category": "Basic Needs / General Store Items",
      "brand": "Puma",
      "product": "Puma's Recycled Sneakers",
      "description": "Sneakers made from recycled materials and sustainable practices.",
      "carbon_reduce": 100
    },
    {
      "category": "Basic Needs / General Store Items",
      "brand": "Nirma",
      "product": "Nirma Green Detergent",
      "description": "A more eco-friendly detergent with reduced environmental impact.",
      "carbon_reduce": 100
    },
    {
      "category": "Basic Needs / General Store Items",
      "brand": "Seventh Generation",
      "product": "Seventh Generation Recycled Toilet Paper",
      "description": "Toilet paper made from 100% recycled paper.",
      "carbon_reduce": 50
    },
    {
      "category": "Basic Needs / General Store Items",
      "brand": "EcoVessel",
      "product": "EcoVessel Insulated Water Bottle",
      "description": "Reusable water bottles made from stainless steel and designed to reduce single-use plastic waste.",
      "carbon_reduce": 30
    },
    {
      "category": "Cosmetics",
      "brand": "Kiehl’s",
      "product": "Kiehl’s Ultra Facial Cream (with eco-friendly packaging)",
      "description": "Skincare products using eco-friendly packaging and sustainable ingredients.",
      "carbon_reduce": 20
    },
    {
      "category": "Cosmetics",
      "brand": "Neutrogena",
      "product": "Neutrogena Hydro Boost Water Gel (with sustainable packaging)",
      "description": "Skincare products that use sustainable practices and packaging.",
      "carbon_reduce": 20
    },
    {
      "category": "Cosmetics",
      "brand": "Burt’s Bees",
      "product": "Burt’s Bees Lip Balm",
      "description": "Lip balm made from natural ingredients and eco-friendly packaging.",
      "carbon_reduce": 20
    },
    {
      "category": "Cosmetics",
      "brand": "Lush",
      "product": "Lush Shampoo Bars",
      "description": "Solid shampoo bars made from natural ingredients with minimal packaging.",
      "carbon_reduce": 20
    },
    {
      "category": "General Usage Item",
      "brand": "Unilever",
      "product": "Sustainable Home Care Products",
      "description": "Cleaning products made from eco-friendly ingredients and packaging.",
      "carbon_reduce": 30
    },
    {
      "category": "General Usage Item",
      "brand": "Ecover",
      "product": "Ecover Dish Soap",
      "description": "Biodegradable dish soap made from plant-based ingredients.",
      "carbon_reduce": 20
    },
    {
      "category": "General Usage Item",
      "brand": "Method",
      "product": "Method All-Purpose Cleaner",
      "description": "Eco-friendly all-purpose cleaner made from non-toxic, biodegradable ingredients.",
      "carbon_reduce": 30
    },
    {
      "category": "General Usage Item",
      "brand": "Ecos",
      "product": "Plant-based Laundry Detergent",
      "description": "Plant-based laundry detergent with a focus on sustainability.",
      "carbon_reduce": 40
    }
  ]
  
export {dummydata,questions,rewards,projects,product}