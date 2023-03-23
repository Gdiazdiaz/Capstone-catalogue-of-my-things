require_relative '../lib/books/book'

describe Book do
  before :each do
    @book = Book.new('Macaw Co', 'good', '2023-12-12')
  end
  context '#new' do
    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  context '#cover_state' do
    it 'returns the correct cover state' do
      expect(@book.cover_state).to eql 'good'
    end
  end
  context '#can_be_archived?' do
    it 'should return false' do
      expect(@book.can_be_archived?).to eql false
    end
  end
  it 'should return true when cover_state is bad' do
    @bad_cover_book = Book.new('Macaw Co', 'bad', '2023-12-12')
    expect(@bad_cover_book.can_be_archived?).to eql true
  end
end
