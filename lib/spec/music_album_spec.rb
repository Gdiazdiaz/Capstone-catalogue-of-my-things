require_relative '../genre'
require_relative '../music_album'

describe 'Music Album class test cases.' do
  context 'Should take three parameters.' do
    it 'Returns a MusicAlbum object' do
      album = MusicAlbum.new(publish_date: '2023-03-21', on_spotify: true)
      expect(album).to be_an_instance_of MusicAlbum
    end
  end
end
