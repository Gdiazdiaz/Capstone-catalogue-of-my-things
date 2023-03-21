require_relative '../data/preserve_data'
require_relative '../lib/books/book'
require_relative '../lib/books/label'
require 'json'
require 'uuid'

class App
  def initialize(books_array: [], labels_array: [])
    @books_array = books_array
    @labels_array = labels_array
  end

  def book_list
    books_listed
  end

  def game_list
    puts 'pending feature'
  end

  def movie_list
    puts 'pending feature'
  end

  def genre_list
    puts 'pending feature'
  end

  def label_list
    labels_listed
  end

  def author_list
    puts 'pending feature'
  end

  def source_list
    puts 'pending feature'
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
    puts 'pending feature'
  end

  def exit
    puts 'Thank you for using our services'
    abort
  end
end
