require_relative '../modules/book'

describe Book do
  before :each do
    @book = Book.new(id: 01, publisher: 'Macaw Co', cover_state: 'bad', publish_date: '12/12/2023', archived: false)
  end

  describe '#new' do
    it 'returns a new object' do
      @book.should be_an_instance_of Book
    end

    it 'returns true for' do
        expect(@book.can_be_archived?).to be true
    end
  end
end