require 'securerandom'

class Genre
  attr_accessor :name, :music_genere
  attr_reader :id

  def initialize(name, id = SecureRandom.uuid)
    @id = id
    @name = name
    @music_genere = []
  end

  def add_item(item)
    @music_genere << item
    item.genre = self
  end
end