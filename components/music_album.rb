require_relative './item'
require 'json'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name

  def initialize(name, on_spotify,  genre='')
    super
    @on_spotify = on_spotify
    @name = name
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

  def self.create_json(object)
    new(*object['a'])
  end
end
