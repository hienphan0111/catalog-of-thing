require_relative './item'
require 'json'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name
  attr_reader :genre

  def initialize(name, on_spotify, publish_date, genre = '')
    super(publish_date)
    @on_spotify = on_spotify
    @name = name
    @genre = genre
  end

  def can_be_archived?
    @on_spotify == true || super
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [name, on_spotify, publish_date, genre]
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
