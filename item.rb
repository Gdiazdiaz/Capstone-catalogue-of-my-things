require 'securerandom'
require 'date'

class Item
  def initialize(publish_date:)
    @id = SecureRandom.hex(10)
    @publish_date = publish_date
    @archived = false
    @source = nil
  end

  attr_accessor :genre, :author, :label, :source
  attr_reader :publish_date

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
    (Date.today - Date.parse(@publish_date)).to_i / 365 > 10
  end
end
