require_relative '../../item'
class Book < Item
  def initialize(publish_date:, publisher:, cover_state:)
    super(publish_date: publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad'
  end
end