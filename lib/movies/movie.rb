require_relative '../../item'
class Movie < Item
  attr_reader :silent

  def initialize(publish_date:, silent:)
    super(publish_date: publish_date)
    @silent = silent
  end

  private

  def can_be_archived?
    return true if super && @silent == true

    false
  end
end
