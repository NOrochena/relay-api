# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: 'nick', password: 'password')
user2 = User.create(username: 'shu', password: 'password')
user3 = User.create(username: 'marcus', password: 'password')

chat1 = Chat.create(user: user1)
chat2 = Chat.create(user: user2)
chat3 = Chat.create(user: user3)

Message.create(user: user1, chat: chat1, content: 'Hype')
Message.create(user: user2, chat: chat1, content: 'Hypeee')
Message.create(user: user1, chat: chat2, content: 'Hype')
Message.create(user: user3, chat: chat2, content: 'Hype213')
Message.create(user: user1, chat: chat3, content: 'Hype1')
Message.create(user: user2, chat: chat3, content: 'Hype2')
Message.create(user: user3, chat: chat3, content: 'Hype3')
