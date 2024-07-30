User.destroy_all
BoardGame.destroy_all
Review.destroy_all
Collection.destroy_all
CollectionBoardGame.destroy_all

puts "🌱 Seeding spices..."

puts "Creating users..."
user1 = User.create(username: "AliceInWonderland33")
user2 = User.create(username: "BobsBurgers")
user3 = User.create(username: "CharliesAngels1")
user4 = User.create(username: "DianaWW")

puts "Creating board games..."
game1 = BoardGame.create(name: "Catan", image: "https://cdn.openart.ai/uploads/image_GSPA1RvZ_1722263694326_raw.jpg",
                         description: "A strategy game about building settlements.")
game2 = BoardGame.create(name: "Ticket to Ride", image: "https://cdn.openart.ai/uploads/image_Twr0mAsq_1722263736380_raw.jpg",
                         description: "A game about building train routes.")
game3 = BoardGame.create(name: "Carcassonne", image: "https://cdn.openart.ai/uploads/image_-TyzzXNj_1722263781459_raw.jpg",
                         description: "A tile-placement game where you build a medieval landscape.")
game4 = BoardGame.create(name: "Pandemic", image: "https://cdn.openart.ai/uploads/image_11iZw04q_1722263917722_raw.jpg",
                         description: "A cooperative game about curing diseases.")

puts "Creating reviews..."
Review.create(user: user1, board_game: game1, title: "Great game!",
              body: "I really enjoyed playing Catan. Highly recommend it!", rating: 5)
Review.create(user: user2, board_game: game2, title: "Fun and engaging",
              body: "Ticket to Ride is a fantastic game with a lot of replay value.", rating: 4)
Review.create(user: user3, board_game: game3, title: "Interesting mechanics",
              body: "Carcassonne offers a unique gameplay experience.", rating: 4)
Review.create(user: user4, board_game: game4, title: "Thrilling cooperative play",
              body: "Pandemic is a challenging game that requires teamwork.", rating: 5)

puts "Creating collections..."
collection1 = Collection.create(user: user1)
collection2 = Collection.create(user: user2)
collection3 = Collection.create(user: user3)
collection4 = Collection.create(user: user4)

puts "Creating collection board games..."
CollectionBoardGame.create(board_game: game1, collection: collection1)
CollectionBoardGame.create(board_game: game2, collection: collection1)
CollectionBoardGame.create(board_game: game3, collection: collection2)
CollectionBoardGame.create(board_game: game4, collection: collection2)
CollectionBoardGame.create(board_game: game1, collection: collection3)
CollectionBoardGame.create(board_game: game4, collection: collection3)
CollectionBoardGame.create(board_game: game2, collection: collection4)
CollectionBoardGame.create(board_game: game3, collection: collection4)

puts "✅ Done seeding!"
