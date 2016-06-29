# Users
['a@a.com', 'b@b.com', 'c@c.com'].each do |email|
  User.create(email: email, password: '123456', password_confirmation: '123456')
end

# Games
Game.create(challenger_id: 1, challenged_id: 2, board_id: 1)
Game.create(challenger_id: 1, challenged_id: 3, board_id: 2)
Game.create(challenger_id: 2, challenged_id: 1, board_id: 3)

# Boards
[1..3].each do |num|
  Board.create(game_id: num)
end
