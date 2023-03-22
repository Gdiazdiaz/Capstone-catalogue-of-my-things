require_relative '../data/preserve_data'
require_relative '../lib/books/book'
require_relative '../lib/books/label'
require_relative '../lib/handle_data'
require_relative '../lib/game'
require 'json'
# require 'uuid'

class App
  include AppModule
  def initialize
    books_data = HandleData.new('book')
    @books = books_data.read.map do |book|
      Book.new(
        publisher: book['publisher'],
        cover_state: book['cover_state'],
        publish_date: book['publsh_date']
      )
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

  def book_list
    puts @books
  end

  def game_list
    if @games.empty?
      puts 'No game, try to add new one'
    else
      @games.map do |game|
        puts "#{game.publish_date}, #{game.last_played_at}"
      end
    end
  end

  def movie_list
    puts @movies
  end

  def genre_list
    puts @genres
  end

  def label_list
    puts @labels
  end

  def author_list
    puts @authors
  end

  def source_list
    puts @sources
  end

  def add_book
    puts "Let's create a book"
    puts "Can we have this book's title?"
    title = gets.chomp
    puts "Can we have this book's publish date?"
    p_date = gets.chomp
    puts "Can we have this book's publisher?"
    publisher = gets.chomp
    puts "Can we have this book's cover state?"
    c_state = gets.chomp
    puts "Can we have this book's cover color?"
    c_color = gets.chomp
    id = UUID.generate
    label = Label.new(id: id, title: title, color: c_color)
    book = Book.new(id: id, publish_date: p_date, publisher: publisher, cover_state: c_state, archived: false)
    save_book(book, label)
    puts 'Book added successfully'
  end

  def add_album
    puts 'pending feature'
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
      book_json.push({
                       id: book.id,
                       publish_date: book.publish_date,
                       archived: book.archived,
                       source: book.source,
                       publisher: book.publisher,
                       cover_state: book.cover_state
                     })
    end
    HandleData.new('book').write(book_json)
    puts 'Thank you for using our services'
    abort
  end
end
