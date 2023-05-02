require_relative './item'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [publish_date, publisher, cover_state]
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
