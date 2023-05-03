require_relative './spec_helper'

describe Game do
  let(:game) do
    Game.new('2005-02-02', 'Modern Warfare', true, '2012-01-01')
  end

  it 'sets the last_played_at, name, multiplayer, publish_date' do
    expect(game.name).to eq 'Modern Warfare'
    expect(game.multiplayer).to eq true
    expect(game.publish_date).to eq Date.parse('2005-02-02')
    expect(game.last_played_at).to eq Date.parse('2012-01-01')
  end

  it 'returns true if the game was last played more than 2 years ago' do
    game = Game.new('2005-02-02', 'Modern Warfare', true, '2012-01-01')
    expect(game.can_be_archived?).to eq true
  end

  it 'sets the archived attribute to true' do
    game = Game.new('2005-02-02', 'Modern Warfare', true, '2012-01-01')
    game.move_to_archive
    expect(game.archived).to eq true
  end

  it 'sets the author' do
    author = Author.new('John Doe')
    game.author = author
    expect(game.author).to eq author
  end

  it 'adds the game to the author items' do
    author = Author.new('John Doe')
    game.author = author
    expect(author.games).to include game
  end
end
