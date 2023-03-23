require_relative '../lib/books/book'
require_relative '../lib/books/label'
require_relative '../lib/author'
require_relative '../lib/handle_data'
require_relative '../lib/game'
require 'json'
require_relative '../lib/modules/add_book'
require_relative '../lib/modules/book_list'
require_relative '../lib/modules/label_list'
require_relative '../lib/modules/music/add_music_album'
require_relative '../lib/modules/music/list_genre'
require_relative '../lib/modules/music/list_music_album'
require_relative '../lib/music/load_music'
require_relative '../lib/music/music_album'
require_relative '../lib/music/genre'

class App
  include AddBook
  include BookList
  include LabelList
  include AddMusicAlbum
  include ListGenre
  include ListMusicAlbums

  def initialize
    @genres = Load.genre
    @music_albums = Load.albums
    books_data = HandleData.new('book')
    @books = books_data.read.map do |book|
      book
    end
    labels_data = HandleData.new('label')
    @labels = labels_data.read.map do |label|
      label
    end

    games_data = HandleData.new('game')
    @games = games_data.read.map do |game|
      Game.new(
        game['publish_date'],
        game['multiplayer'],
        game['last_played_at']
      )
    end
  end

  def game_list
    if @games.empty?
      puts 'No game, try to add new one'
    else
      puts 'Books on our list:'
      @games.map do |game|
        puts "#{game.publish_date}, #{game.last_played_at}"
      end
    end
  end

  def movie_list
    puts @movies
  end

  def genre_list
    list_genres
  end

  def author_list
    puts @authors
  end

  def source_list
    puts @sources
  end

  def list_music_album
    list_music_albums
  end

  def add_album
    add_music_album
  end

  def add_movie
    puts 'pending feature'
  end

  def add_game
    puts "Let's create a game"
    puts 'Published Date'
    publish_date = gets.chomp
    puts 'Is it muliplayer: yes or no'
    multiplayer = gets.chomp
    puts 'Last played date: d/m/y'
    last_played_at = gets.chomp
    new_game = Game.new(publish_date, multiplayer, last_played_at)
    @games.push(new_game)
    puts 'Games Created succesffully'
  end

  def exit
    game_json = []
    @games.map do |game|
      game_json.push({
                       id: game.id,
                       archived: game.archived,
                       source: game.source,
                       publish_date: game.publish_date,
                       last_played_at: game.last_played_at,
                       muliplayer: game.multiplayer
                     })
    end
    HandleData.new('game').write(game_json)

    book_json = []
    @books.map do |book|
      book_json.push(book)
    end
    HandleData.new('book').write(book_json)

    label_json = []
    @labels.map do |label|
      label_json.push(label)
    end
    HandleData.new('label').write(label_json)
    puts 'Thank you for using our services'
    abort
  end
end
