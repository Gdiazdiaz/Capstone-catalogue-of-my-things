require_relative './helper_spec'

describe 'Test cases for Genre class' do
  before(:each) do
    @genre = Genre.new('music')
  end

  context 'Genre object' do
    it 'Should takes one parameter and the return a genre object' do
      @genre = Genre.new('music')
      expect(@genre).to be_instance_of(Genre)
    end
  end
  context 'Invoking genre_object.name' do
    it 'returns string' do
      @genre = Genre.new('music')
      expect(@genre.name).to be_kind_of(String)
    end

    it 'Should return the correct name' do
      @genre = Genre.new('music')
      expect(@genre.name).to eql 'music'
    end
  end

  context "Invoking genre_object.add_item(album_item) method\n" do
    it 'Should add "album_item" into "genre_object.items" array' do
      album_item = MusicAlbum.new('2020-10-10', on_spotify: true)
      @genre = Genre.new('music')
      @genre.add_item(album_item)
      expect(@genre.items).to include(album_item)
    end
  end
end
