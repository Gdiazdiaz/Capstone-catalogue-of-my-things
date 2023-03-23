require_relative '../lib/books/label'
require_relative '../item'

describe Label do
  before :each do
    @label = Label.new('Test Title', 'Test color')
    @item = Item.new('2023-12-12')
  end

  describe '#new' do
    it 'returns a new object' do
      expect(@label).to be_instance_of(Label)
      # @label.should be_an_instance_of Label
    end

    it 'add new item' do
      @label.add_item(@item)
      expect(@label.items).to include(@item)
      expect(@item.label).to eq @label
    end
  end
end
