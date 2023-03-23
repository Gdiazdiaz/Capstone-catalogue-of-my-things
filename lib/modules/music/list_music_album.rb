module ListMusicAlbums
  def list_music_albums
    before_list_music_album

    @music_albums.each_with_index do |album, index|
      puts '---------------------------------------------------------'
      puts "  Index: #{index + 1}"
      puts "  ID: #{album.id}"
      puts "  Title: #{album.label.title}"
      puts "  Genre: #{album.genre.name}"
      puts "  Author: #{album.author.first_name} #{album.author.last_name}"
      puts "  On Spotify?: #{album.on_spotify}"
      puts "  Publish Date: #{album.publish_date}"
      puts "  Archived: #{album.archived}"
      puts '------------------------------------------------------------'
    end

    puts 'Press enter to continue'
    gets
    system('clear')
    system('cls')
    # start_app
  end

  def before_list_music_album
    puts 'Hello User!, Wellcome Here is the list of Music Albums we have'
  end
end
