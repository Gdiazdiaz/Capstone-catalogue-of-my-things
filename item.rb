class Item
  def initialize(id:, archived:, publish_date:)
    @id = id
    @archived = archived
    @publish_date = publish_date
  end

  attr_accessor :genre, :author, :lable

  def can_be_archived?
    return true if Date.strptime(publish_date, '%d/%m/%Y') < Date.today - 3652

    false
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
