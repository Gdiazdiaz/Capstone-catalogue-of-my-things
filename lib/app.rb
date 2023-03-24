require_relative './helpers/handle_data'
require_relative './game'
require_relative './modules/game'
require_relative './modules/book'
require_relative './modules/music_album'
require_relative './modules/movies'
require_relative './book'
require_relative './music_album'
require_relative './genre'
require_relative './movie'

class App
  include GameModule
  include BookModule
  include MusicAlbumModule
  include MovieModule

  def initialize
    load_movies
    load_games
    @music_albums = load_music_albums
    @books = load_books
    @genres = []
    @labels = []
  end

  def genre_list
    puts @genres
  end

  def save_files
    save_game(@games)
    # save_book(@books)
    # save_music_albums(@music_albums)
    save_movies(@movies)
  end
end
