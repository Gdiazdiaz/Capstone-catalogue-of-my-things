require_relative '../item'
require 'date'
require 'securerandom'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  
  def initialize(archived, publish_date, multiplayer, last_played_at)
    super(id: SecureRandom.uuid, publish_date: publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end


  private

  def can_be_archived?
    super() && year_since_last_played_at > 2
  end

  def year_since_last_played_at
    d = (Date.today - Date.parse(last_played_at)) / 365
    d.to_i
  end
end
