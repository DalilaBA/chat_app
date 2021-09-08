# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: "dali", password: "123")
User.create(username: "ami", password: "123")
User.create(username: "nani", password: "123")
User.create(username: "kaki", password: "123")
User.create(username: "sali", password: "123")
User.create(username: "bali", password: "123")

Message.create(body: "hello", user_id: 1)
Message.create(body: "hey everyone", user_id: 4)
Message.create(body: "I'm nw here hello", user_id: 3)
Message.create(body: "Welcome", user_id: 5)
Message.create(body: "Hey hey hey :D", user_id: 2)

