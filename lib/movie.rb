require_relative './item'
require_relative './source'

class Movie < Item
  attr_accessor :silent

  def initialize(publish_date:, silent:)
    super(publish_date: publish_date)
    @silent = silent
  end

  private

  def can_be_archived?
    super or @silent
  end
end

movie = Movie.new(publish_date: '12/21/2011', silent: true)
source = Source.new(name: 'somewhere')
source.add_item(movie)
