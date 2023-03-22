require 'rspec'
require_relative '../lib/movies/movie'

RSpec.describe Movie do
  subject { described_class.new(publish_date: '2022-01-01', silent: true) }

  describe '#initialize' do
    it 'creates a new movie with publish date and silent vars' do
      expect(subject).to be_instance_of(described_class)
      expect(subject.publish_date).to eql('2022-01-01')
      expect(subject.silent).to eql(true)
    end
  end
end
