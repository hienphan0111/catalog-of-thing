require_relative './item'
require_relative './author'
require 'json'

class Game < Item
  attr_reader :name, :multiplayer, :last_played_at

  def initialize(publish_date, name, multiplayer, last_played_at = '2020-01-01', author = nil)
    super(publish_date)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
    @author = author
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def can_be_archived?
    @last_played_at < Date.today.prev_year(2) && super
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [publish_date, name, multiplayer, last_played_at, author]
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
