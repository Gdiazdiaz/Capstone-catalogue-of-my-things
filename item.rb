class Item
    def initialize(id:, archived:, publish_date:)
        @id = id
        @archived = archived
        @publish_date = publish_date
    end

    attr_accessor : genre, author, lable

    def can_be_archived?
        if Date.strptime(publish_date, '%d/%m/%Y') < Date.today - 3652
            return true
        else return false
        end
    end

    def move_to_archive
        if can_be_archived?
            @archived = true
        end
    end
end