class Movie < Item
  def initialize(publish_date:, silent:)
    super(publish_date)
    @silent = silent
  end

  def can_be_archived?
    return true if super && @silent == true

    false
  end
end
