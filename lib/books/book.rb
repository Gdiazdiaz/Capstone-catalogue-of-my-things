require_relative '../../item'
class Book < Item
  def initialize(id:, publish_date:, archived:, publisher:, cover_state:)
    super(id: id, publish_date: publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad'
  end
end
