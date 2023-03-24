require 'securerandom'
require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :publish_date, :source
  attr_writer :genre,:author, :label

  def initialize(publish_date:, archived: false, id: SecureRandom.hex(10))
    @id = id
    @publish_date = publish_date
    @archived = archived
    @source = nil
  end

  def add_source(source)
    @source = source
    return if source.nil?

    source.items.push(self) unless source.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today - Date.parse(@publish_date)).to_i / 365 > 10
  end
end
