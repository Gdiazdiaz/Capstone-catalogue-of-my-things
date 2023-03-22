require 'securerandom'

class Genre
  attr_accessor :name, :music_genre
  attr_reader :id

  def initialize(name, id = SecureRandom.uuid)
    @id = id
    @name = name
    @music_genre = []
  end

  def add_item(item)
    @music_genre << item
    item.genre = self
  end
end
