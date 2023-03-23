module GameModule
  def load_games
    games_data = HandleData.new('game')
    games_data.read.map do |game|
      new_game = Game.new(publish_date: game['publish_date'], multiplayer: game['multiplayer'],
                          last_played_at: game['last_played_at'])
      author = Author.new(
        first_name: game['author']['first_name'],
        last_name: game['author']['last_name']
      )
      author.add_item(new_game)
      new_game
    end
  end

  def add_game
    puts "Let's create a game"
    puts 'Published Date'
    publish_date = gets.chomp
    puts 'Is it muliplayer: yes or no'
    multiplayer = gets.chomp
    puts 'Last played date: d/m/y'
    last_played_at = gets.chomp
    new_game = Game.new(publish_date: publish_date, multiplayer: multiplayer, last_played_at: last_played_at)
    puts "Let's create a author for the Item: "
    puts 'First Name '
    first_name = gets.chomp
    puts 'Last Name: '
    last_name = gets.chomp
    new_author = Author.new(first_name: first_name, last_name: last_name)
    new_author.add_item(new_game)
    @authors.push(new_author)
    @games.push(new_game)
    puts 'Games Created succesffully'
  end

  def game_list
    puts @games.length
    if @games.empty?
      puts 'No game, try to add new one'
    else
      puts 'Games on our list:'
      @games.map do |game|
        puts "#{game.publish_date}, #{game.last_played_at}"
      end
    end
  end

  def save_game(games)
    game_json = []
    games.map do |game|
      game_json.push({
                       id: game.id,
                       archived: game.archived,
                       source: game.source,
                       publish_date: game.publish_date,
                       last_played_at: game.last_played_at,
                       multiplayer: game.multiplayer,
                       author: {
                         id: game.author.id,
                         first_name: game.author.first_name,
                         last_name: game.author.last_name
                       }
                     })
    end
    HandleData.new('game').write(game_json)
  end
end
