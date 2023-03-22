require 'rspec'
require_relative '../lib/movies/source'
require_relative '../lib/movies/movie'
require_relative '../item'

RSpec.describe Source do
  subject { described_class.new('Online Shop') }

  describe '#initialize' do
    it 'creates a new source with a name and an empty items array' do
      expect(subject).to be_instance_of(described_class)
      expect(subject.name).to eql('Online Shop')
      expect(subject.items).to eql([])
    end
  end

  describe '#add_item' do
    let(:movie) { Movie.new(publish_date: '1997-01-22', silent: true) }
    let(:item) { Item.new(publish_date: '1997-01-22') }

    it 'adds Item to @items array and sets @source of Item' do
      expect(subject.add_item(item)).to include(item)
      expect(item.source).to eql(subject)
    end

    it 'adds Movie to @items array and sets @source of Movie' do
      expect(subject.add_item(movie)).to include(movie)
      expect(movie.source).to eql(subject)
    end
  end
end
