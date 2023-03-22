require 'securerandom'

class Label
  def initialize(title:, color:)
    @id = SecureRandom.hex(10)
    @title = title
    @color = color
    @items = []
  end

  attr_accessor :id, :title, :color, :items

  def add_item(item)
    item.label = self
    @items << item
  end
end
