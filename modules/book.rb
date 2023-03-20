require_relative '../item'
class Book < Item
    def initialize(publisher:, cover_state:)
        super(id, publish_date, archived)
        @publisher = publisher
        @cover_state = cover_state
    end

    def can_be_archived?
        if can_be_archived? || cover_state == 'bad'
            true
        else
            false
        end
    end
end