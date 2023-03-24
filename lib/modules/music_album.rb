module MusicAlbumModule
  def load_music_albums
    @genres = []
    @music_albums = []
    music_album_data = HandleData.new('music_album')
    music_album_data.read.map do |album|
      new_album = MusicAlbum.new(publish_date: album['publish_date'], on_spotify: album['on_spotify'])
      genre = Genre.new(name: album['genre']['name'])
      genre.add_item(new_album)
      @genres.push(genre)
      @music_albums.push(new_album)
    end
  end

  def music_album_list
    puts '=========================================================='
    if @music_albums.empty?
      puts 'No Music Albums'
    else
      puts "\t\tMusic Albums on our list:"
      puts '--------------------------------------------------------'
      @music_albums.each_with_index do |album, index|
        puts "#{index + 1}
          Is on spotify: #{album.on_spotify}
          Published Date: #{album.publish_date}"
      end
    end
    puts '=========================================================='
  end

  def genre_list
    puts '=========================================================='
    if @genres.empty?
      puts 'No Genre'
    else
      puts "\t\tGenre on our list:"
      puts '--------------------------------------------------------'
      @genres.each_with_index do |genre, index|
        puts "#{index + 1} Name: #{genre.name}"
      end
    end
    puts '=========================================================='
  end

  def add_music_album
    print 'Enter album\'s genre: '
    genre_name = gets.chomp

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
    music_album = MusicAlbum.new(publish_date: album_publish_date, on_spotify: is_on_spotify)

    genre = Genre.new(name: genre_name)
    genre.add_item(music_album)

    @music_albums.push(music_album)
    puts 'Album has been added successfully!'
  end

  def save_music_albums(music_albums)
    music_album_json = []
    music_albums.map do |album|
      music_album_json.push({
                              id: album.id,
                              on_spotify: album.on_spotify,
                              publish_date: album.publish_date,
                              archived: album.archived,
                              genre: {
                                id: album.genre.id,
                                name: album.genre.name
                              }
                            })
    end
    HandleData.new('music_album').write(music_album_json)
  end
end
