require_relative '../item'
require 'date'

class Game < Item
  def initialize(multiplayer, last_played_at)
    super(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super() && year_since_last_played_at > 2
  end

  private

  def year_since_last_played_at
    d = (Date.today - Date.parse(last_played_at)) / 365
    d.to_i
  end
end
