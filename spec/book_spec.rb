require_relative '../lib/books/book'

describe Book do
  before :each do
    @book = Book.new(publisher: 'Macaw Co', cover_state: 'bad', publish_date: '12/12/2023')
  end

  describe '#new' do
    it 'returns a new object' do
      expect(@book).to be_instance_of(Book)
    end

    it 'returns true for' do
      expect(@book.can_be_archived?).to be true
    end
  end
end
