require_relative './item'
require_relative './genre'
require 'date'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date: Date.today, on_spotify: false)
    super(publish_date: publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
