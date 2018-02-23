# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Card.create([
  {title: 'Werewolf', side: 1},
  {title: 'Villager', side: 0},
  {title: 'Seer', side: 0},
  {title: 'Wizard', side: 0},
  {title: 'Protector', side: 0},
  {title: 'Hunter', side: 0},
  {title: 'Wolfman', side: 1},
  {title: 'Patriarch', side: 0},
  {title: 'Cursed Wolf', side: 1},
  {title: 'Wild Child', side: 2}]);

Game.create([
  {room_id: 1, state: 0, number_of_player: 1},
  {room_id: 2, state: 1, number_of_player: 12},
  {room_id: 3, state: 0, number_of_player: 1, has_pass: true},
  {room_id: 4, state: 1, number_of_player: 20, has_pass: true},
  {room_id: 5, state: 1, number_of_player: 24},
  {room_id: 6, state: 0, number_of_player: 2},
  {room_id: 7, state: 0, number_of_player: 2},
  {room_id: 8, state: 2, number_of_player: 20},
  {room_id: 9, state: 1, number_of_player: 12}])

User.create([
  {email: 'user1@gmail.com', password: '123123',
    password_confirmation: '123123', nickname: 'user1'},
  {email: 'user2@gmail.com', password: '123123',
    password_confirmation: '123123', nickname: 'user2'},
  {email: 'user3@gmail.com', password: '123123',
    password_confirmation: '123123', nickname: 'user3'},
  {email: 'user4@gmail.com', password: '123123',
    password_confirmation: '123123', nickname: 'user4'},
  {email: 'user5@gmail.com', password: '123123',
    password_confirmation: '123123', nickname: 'user5'},
  {email: 'user6@gmail.com', password: '123123',
    password_confirmation: '123123', nickname: 'user6'},
  {email: 'user7@gmail.com', password: '123123',
    password_confirmation: '123123', nickname: 'user7'},
  {email: 'user8@gmail.com', password: '123123',
    password_confirmation: '123123', nickname: 'user8'},
  {email: 'user9@gmail.com', password: '123123',
    password_confirmation: '123123', nickname: 'user9'},
  {email: 'user10@gmail.com', password: '123123',
    password_confirmation: '123123', nickname: 'user10'},
  {email: 'user11@gmail.com', password: '123123',
    password_confirmation: '123123', nickname: 'user11'}])

Friend.create([
  {user_id: 1, user2_id: 2},
  {user_id: 1, user2_id: 3},
  {user_id: 1, user2_id: 4},
  {user_id: 2, user2_id: 1},
  {user_id: 2, user2_id: 4},
  {user_id: 3, user2_id: 1},
  {user_id: 4, user2_id: 8},
  {user_id: 5, user2_id: 11},
  {user_id: 11, user2_id: 5},
  {user_id: 6, user2_id: 10}])

