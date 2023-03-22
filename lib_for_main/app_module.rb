require_relative '../lib/music/add_music_album'
require_relative '../lib/music/list_genre'
require_relative '../lib/music/list_music_album'
require_relative './menu_option'

module AppModule
  include ListMusicAlbums
  include ListGenre
  include AddMusicAlbum

  def menu_items
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List all games'
    puts '5 - List all genres'
    puts '6 - List all labels'
    puts '7 - List all authors'
    puts '8 - List all sources'
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '0 - Exit'
  end

  def handle_menu
    print 'Option: '
    selected_option = gets.chomp.to_i
    system('clear')
    system('cls')
    quit_app if selected_option.zero?
    menu_option(selected_option)
  end

  def quit_app
    puts 'Thank you for using the app!'
    exit
  end
end
