require_relative '../lib/game'
require_relative '../item'
require 'securerandom'
require 'date'

describe Game do
  before(:each) do
    @game = Game.new(false, '03/01/2011', 'xxx', '01/01/2020')
  end

  it 'it is an instance of Game class' do
    expect(@game).to be_instance_of(Game)
  end

  it 'Should return correctly for can_be_archived method' do
    expect(@game.send(:can_be_archived?)).to be true
  end

  it 'Should return true if published years > 10 and last played > 2' do
    new_game = Game.new(false, '03/01/2000', 'xxx', '01/01/2020')
    expect(new_game.send(:can_be_archived?)).to be true
  end

  it 'Should return false if published years > 10 and last played < 2' do
    new_game = Game.new(false, '03/01/2000', 'xxx', '01/01/2022')
    expect(new_game.send(:can_be_archived?)).to be false
  end

  it 'Should return false if published years < 10 and last played > or < 2' do
    new_game = Game.new(false, '03/01/2015', 'xxx', '01/01/2022')
    expect(new_game.send(:can_be_archived?)).to be false
  end
end
