require_relative './helper_spec'

describe 'Genre class test cases' do
  before(:each) do
    @genre = Genre.new('music')
  end

  context 'Genre object' do
    it 'Should takes one parameter and the return a genre object' do
      @genre = Genre.new('music')
      expect(@genre).to be_instance_of(Genre)
    end
  end
end
