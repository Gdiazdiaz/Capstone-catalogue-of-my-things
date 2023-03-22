require_relative './preserve_music_genre'

module AddMusicAlbum
  def add_music_album
    before_add_album

    print 'Enter album\'s genre: '
    genre_name = gets.chomp

    print 'Enter album\'s label: '
    label = gets.chomp

    print 'Enter album\'s author\'s first name: '
    author_first_name = gets.chomp

    print 'Enter album\'s author\'s last name: '
    author_last_name = gets.chomp

    print "\nWhen did it published? [year]: "
    album_publish_date = gets.chomp.to_i

    print 'Is this Music Album on Spotify? [y: true / anykey: false]: '
    spotify = gets.chomp
    is_on_spotify = case spotify.downcase
                    when 'y'
                      true
                    else
                      puts 'on_spotify set to false'
                      false
                    end
    music_album = MusicAlbum.new(album_publish_date, on_spotify: is_on_spotify)

    label = Label.new(label, 'Green')
    label.add_item(music_album)

    author = Author.new(author_first_name, author_last_name)
    author.add_item(music_album)

    genre = Genre.new(genre_name)
    genre.add_item(music_album)

    @labels << label
    @authors << author
    @genres << genre
    @music_albums << music_album

    PreserveMusicGenre.albums(music_album)
    PreserveMusicGenre.genres(genre)
    puts 'Album has been added successfully!'
    puts 'Press enter to continue'
    gets
    system('clear')
    system('cls')
  end

  def before_add_album
    puts 'Hello user Wellcome, please add a music album'
  end
end
