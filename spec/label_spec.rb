require_relative '../lib/books/label'
require_relative '../item'

describe Label do
  before :each do
    @label = Label.new(title: 'Test Title', color: 'Test color')
    @item = Item.new(publish_date: '12/12/2023')
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
