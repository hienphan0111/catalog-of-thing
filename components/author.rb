require_relative './item'
require 'json'

class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [first_name, last_name]
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
