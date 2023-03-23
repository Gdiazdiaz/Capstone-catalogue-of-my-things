require 'rspec'
require_relative '../lib/movies/movie'
require 'date'

RSpec.describe Movie do
  describe '#initialize' do
    subject { described_class.new('1997-01-22',true) }

    it 'creates a new movie with publish date and silent vars' do
      expect(subject).to be_instance_of(described_class)
      expect(subject.publish_date).to eql('1997-01-22')
      expect(subject.silent).to eql(true)
    end
  end

  describe '#can_be_archived?' do
    context 'when the movie is LESS than 10 years old and is NOT silent' do
      subject { described_class.new( Date.today.to_s, false) }

      it 'returns false' do
        expect(subject.send(:can_be_archived?)).to be false
      end
    end

    context 'when the movie is MORE than 10 years old and is NOT silent' do
      subject { described_class.new('1997-01-17', false) }

      it 'returns true' do
        expect(subject.send(:can_be_archived?)).to be true
      end
    end

    context 'when the movie is LESS than 10 years old and IS silent' do
      subject { described_class.new( Date.today.to_s, true) }

      it 'returns true' do
        expect(subject.send(:can_be_archived?)).to be true
      end
    end

    context 'when the movie is MORE than 10 years old and IS silent' do
      subject { described_class.new( Date.today.to_s, true) }

      it 'returns true' do
        expect(subject.send(:can_be_archived?)).to be true
      end
    end
  end
end
