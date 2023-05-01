require_relative './item'

class Game < Item
  attr_reader :name, :multiplayer, :last_played_at

  def initialize(name:, multiplayer:, last_played_at:, author: nil, **args)
    super(**args)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @author = author
  end

  def author=(author)
    @author = author
    author.games << self unless author.games.include?(self)
  end

  private

  def can_be_archived?
    Date.parse(@last_played_at) < Date.today.prev_year(2) && super
  end
end
