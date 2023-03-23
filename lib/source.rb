require 'securerandom'

class Source
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name:)
    @id = SecureRandom.hex(10)
    @name = name
    @items = []
  end

  def add_item(item)
    item.source = self
    @items.push(item)
  end
end
