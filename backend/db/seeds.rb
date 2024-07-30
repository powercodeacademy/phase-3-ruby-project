# frozen_string_literal: true

puts "🌱 Seeding spices..."

# Create customers
customer1 = Customer.create(first_name: "John", last_name: "Doe", age: 35,
                            phone_number: "1234567890", email_address: "john.doe@example.com")
customer2 = Customer.create(first_name: "Jane", last_name: "Smith", age: 28,
                            phone_number: "2345678901", email_address: "jane.smith@example.com")
customer3 = Customer.create(first_name: "Emily", last_name: "Johnson", age: 42,
                            phone_number: "3456789012", email_address: "emily.johnson@example.com")
customer4 = Customer.create(first_name: "Michael", last_name: "Brown", age: 50,
                            phone_number: "4567890123", email_address: "michael.brown@example.com")
customer5 = Customer.create(first_name: "Linda", last_name: "Davis", age: 37,
                            phone_number: "5678901234", email_address: "linda.davis@example.com")

# Create tools
tool1 = Tool.create(name: "Hammer", description: "A strong hammer.", price_per_day: 5.00,
                    availability: true, category: "Hand Tools", image: "https://pngimg.com/uploads/hammer/hammer_PNG103350.png")
tool2 = Tool.create(name: "Drill", description: "A powerful drill.", price_per_day: 15.00,
                    availability: true, category: "Power Tools", image: "https://www.pngitem.com/pimgs/m/719-7195420_drill-png-transparent-png.png")
tool3 = Tool.create(name: "Pipe Wrench", description: "24in Adjustable wrench.", price_per_day: 7.00,
                    availability: true, category: "Hand Tools", image: "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT4GXun8wswq3afG8qUPxt3KLwo6RwP6yO9h5knV7KT5XXQlJ55s15bh155_5QBzoGtldh-xa2yTpmNqOnIbHlf_JL0wpb2XGejeZwQNdsWCQOdW7NozXyRcmk")
tool4 = Tool.create(name: "Screwdriver Set", description: "Set of DeWalt screwdrivers.", price_per_day: 3.00,
                    availability: false, category: "Hand Tools", image: "https://images.thdstatic.com/productImages/4679fb72-8665-47e3-9ae4-20497f90579e/svn/dewalt-screwdriver-sets-dwht65201-64_1000.jpg")
tool5 = Tool.create(name: "Circular Saw", description: "Circular saw for cutting wood.",
                    price_per_day: 20.00, availability: true, category: "Power Tools", image: "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSF_8yXxQQ5C06bMxJloPa2ecdbklsxWBN09c8C6wX59kteyCSKQtRDMWDZwlwfID4RNxLiVj-SO_g84K7TBYmndtgaOEoCD9kfvuQSBLwFE0yGTZAlfkgQdsUN")
tool6 = Tool.create(name: "Cordless Jigsaw", description: "Electric jigsaw for precision cuts.",
                    price_per_day: 12.00, availability: false, category: "Power Tools", image: "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQXH7of_7zN_mhLa-zfWt9gXdJBps4B9w4YndXnq9OJpo3YRFcTS5IzHdu_L2u0y2Uyl5PMTBORUEw8-Flib9M8hbQihOp0Ic-Z5uE_kSpVhyCAISs8sLAbPT52")
tool7 = Tool.create(name: "Level", description: "Tool for leveling surfaces. 3 foot", price_per_day: 6.00,
                    availability: true, category: "Hand Tools", image: "https://images.thdstatic.com/productImages/b8441e62-54e5-4102-b21c-e90c781683ff/svn/milwaukee-levels-mlibm24-64_300.jpg")
tool8 = Tool.create(name: "Pliers", description: "Multi-purpose pliers.", price_per_day: 4.00,
                    availability: true, category: "Hand Tools", image: "https://m.media-amazon.com/images/I/71AE8yzWXYL._AC_UF894,1000_QL80_.jpg")
tool9 = Tool.create(name: "Tape Measure", description: "30-foot tape measure.",
                    price_per_day: 2.00, availability: true, category: "Hand Tools", image: "https://m.media-amazon.com/images/I/71zDmegOQWL._AC_UF894,1000_QL80_.jpg")
tool10 = Tool.create(name: "Generator", description: "Portable generator.", price_per_day: 30.00,
                     availability: true, category: "Power Tools", image: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTZCut3EX1QseVnEpa-z_JMOYmwxvCt_5Dpg_kr516yWU6cVgF7IvWUD_KoYpHes3KGbE0otnCbBi_NXCoTYN-kFRIjXom_NErcjvtuLpR_5j8dYh_NLVrWiIfi")
tool11 = Tool.create(name: "Ladder", description: "Extension ladder.", price_per_day: 25.00,
                     availability: true, category: "Ladders", image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS6GtDz5DYRu8Lijzven04-pqhZt4Ok3iWSMx4Gxj-jJy2rKUMDHxVDGjzGLQKJHJ9rRFYXpFBVGwnj0jaiW_6S0BaJHWLlOVP0P3Rw4TIbBqgIU4rf8cL6l-M")
tool12 = Tool.create(name: "Sandpaper", description: "Assorted sandpaper sheets.",
                     price_per_day: 1.00, availability: true, category: "Hand Tools", image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQUGvcl6GLde9tuzhUB-GON09voLRp-a30AkxxXv0rS7MKeVHBKHZhUgDSuFDyn5btY1hVHBnQJz_otBoFOHlOmjHa0ntjxcaVkMI6nz55UhKgefXmJHXVti0EY")
tool13 = Tool.create(name: "Wood Chisel Set", description: "Set of chisels for carving.",
                     price_per_day: 8.00, availability: true, category: "Hand Tools", image: "https://www.harborfreight.com/media/catalog/product/cache/c5a7cc0816faf52ed720d0b3840ada0e/5/6/56186_W3.jpg")
tool14 = Tool.create(name: "Angle Grinder", description: "Grinder for cutting and polishing.",
                     price_per_day: 18.00, availability: true, category: "Power Tools", image: "https://atlas-content-cdn.pixelsquid.com/stock-images/dewalt-grinder-angle-Xorl1L5-600.jpg")
tool15 = Tool.create(name: "Router", description: "Electric router for woodworking.",
                     price_per_day: 14.00, availability: true, category: "Power Tools", image: "https://images.thdstatic.com/productImages/ad81d6d8-1369-4b7f-97ab-0a015ab223aa/svn/ryobi-wood-routers-pcl424b-64_600.jpg")

# Create rentals
Rental.create(customer: customer1, tool: tool1, date_out: Date.today - 10, date_in: Date.today - 5)
Rental.create(customer: customer2, tool: tool3, date_out: Date.today - 3, date_in: Date.today - 1)
Rental.create(customer: customer3, tool: tool5, date_out: Date.today - 15, date_in: Date.today - 10)
Rental.create(customer: customer4, tool: tool2, date_out: Date.today - 5, date_in: Date.today - 3)
Rental.create(customer: customer5, tool: tool4, date_out: Date.today - 2, date_in: nil)
Rental.create(customer: customer1, tool: tool6, date_out: Date.today - 1, date_in: nil)

puts "✅ Done seeding!"
