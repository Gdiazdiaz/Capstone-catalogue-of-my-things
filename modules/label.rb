class Label
    def initialize(id:, title:, color:)
        @id = id
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