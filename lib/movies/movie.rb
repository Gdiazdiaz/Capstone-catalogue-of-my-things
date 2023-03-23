require_relative '../../item'
require 'date'
class Movie < Item
  attr_reader :silent

  def initialize(publish_date, silent)
    super(publish_date)
    @silent = silent
  end

  private

  def can_be_archived?
    super or @silent
  end
end
