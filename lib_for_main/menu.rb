require_relative '../lib/app'
require_relative './module/options'

class Menu
  app = App.new

  puts 'Welcome to our app!'
  puts "\n"

  loop do
    Option.new.menu_option
    option = gets.chomp
    case option
    when '1'
      app.book_list
    when '2'
      app.music_album_list
    when '3'
      app.movie_list
    when '4'
      app.game_list
    when '5'
      app.genre_list
    when '6'
      app.label_list
    when '7'
      app.author_list
    when '8'
      app.source_list
    when '9'
      app.add_book
    when '10'
      app.add_music_album
    when '11'
      app.add_movie
    when '12'
      app.add_game
    when '13'
      app.save_files
      puts puts "Thank you for using this app!\n\n"
      break
    when '14'
      puts puts "Thank you for using this app!\n\n"
      break
    else
      puts 'Incorrect input, Please choose between 1 and 7'
    end
  end
end
