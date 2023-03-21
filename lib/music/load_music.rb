class Load
  def self.genre
    file = '../../data/genre.json'
    data = []
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |genre|
        genre = Genre.new(genre['name'], id: genre['id'])
        data << genre
      end
    end
    data
  end

  def self.albums
    file = '../../data/music_album.json'
    data = []
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |albums|
        album = MusicAlbum.new(albums['publish_year'], on_spotify: albums['on_spotify'])
        author = Author.new(albums['author']['first_name'], albums['author']['last_name'], id: albums['author']['id'])
        label = Label.new(albums['label']['title'], id: albums['label']['id'])
        genre = Genre.new(albums['genre']['name'], id: albums['genre']['id'])

        album.label = label
        album.genre = genre
        album.author = author
        data << album
      end
    end
    data
  end
end
