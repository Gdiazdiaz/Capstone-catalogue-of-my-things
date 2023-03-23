require_relative '../../item'
require 'date'
require 'securerandom'

class Book < Item
  # def initialize(publish_date = Date.today, publisher, cover_state, id = SecureRandom.uuid)
  #   super(publish_date, id)
  #   @publisher = publisher
  #   @cover_state = cover_state
  # end

  # attr_accessor :id, :publisher, :cover_state, :publish_date, :archived
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date = Date.today, id = SecureRandom.uuid)
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad' || super
  end
end
