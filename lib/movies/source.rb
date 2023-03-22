require 'securerandom'

class Source
  def initialize(name)
    @id = SecureRandom.hex(10)
    @name = name
    @items = []
  end

  attr_reader :id, :name, :items

  def add_item(item)
    item.source = self
    @items.push(item)
  end
end
