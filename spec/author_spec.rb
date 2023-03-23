require_relative '../lib/author'
require_relative '../lib/game'
require_relative '../item'
require 'securerandom'
require 'date'

describe Author do
  before(:each) do
    @author = Author.new('Birhanu', 'Gudisa')
    # @item = Item.new(publish_date: Date.today)
  end

  it 'it is an instance of Author class' do
    expect(@author).to be_instance_of(Author)
  end

  it 'it should return the first name of author correctly' do
    expect(@author.first_name).to eq('Birhanu')
  end

  it 'it should return the last name of author correctly' do
    expect(@author.last_name).to eq('Gudisa')
  end

  # it 'Should add an item correctly' do
  #   before = @author.items.length
  #   @author.add_item(@item)
  #   expect(@author.items.length).to eq(before + 1)
  # end

  # it 'Should return author for item correctly' do
  #   @author.add_item(@item)
  #   expect(@item.author).to eq(@author)
  # end
  describe '#add_item' do
    it 'should return an array of game objects' do
      game = Game.new(true, '2023-03-23', '2023-03-23')
      @author.add_item(game)
      expect(@author.items).to include(game)
    end
  end
end
