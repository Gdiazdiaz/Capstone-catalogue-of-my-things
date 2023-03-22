require 'securerandom'

class Item
  def initialize(publish_date:)
    @id = SecureRandom.hex(10)
    @publish_date = publish_date
    @archived = false
    @source = nil
  end

  attr_accessor :genre, :author, :label, :source

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def add_source(source)
    @source = source
    return if source.nil?

    source.items.push(self) unless source.items.include?(self)
  end

  private

  def can_be_archived?
    return true if Date.strptime(@publish_date, '%d/%m/%Y') < Date.today - 3652

    false
  end
end
