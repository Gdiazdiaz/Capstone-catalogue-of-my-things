require 'rspec'
require_relative '../lib/movies/movie'

RSpec.describe Movie do
  describe '#initialize' do
    subject { described_class.new(publish_date: '1997-01-22', silent: true) }

    it 'creates a new movie with publish date and silent vars' do
      expect(subject).to be_instance_of(described_class)
      expect(subject.publish_date).to eql('1997-01-22')
      expect(subject.silent).to eql(true)
    end
  end

  describe '#can_be_archived?' do
    context 'when the movie is less than 10 years old and is NOT silent' do
      subject { described_class.new(publish_date: Date.today.to_s, silent: false) }

      it 'returns false' do
        expect(subject.send(:can_be_archived?)).to be false
      end
    end
    
    context 'when the movie is more than 10 years old and is NOT silent' do
      subject { described_class.new(publish_date: '1997-01-17', silent: false) }

      it 'returns true' do
        expect(subject.send(:can_be_archived?)).to be true
      end
    end
  end
end
