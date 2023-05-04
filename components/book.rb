require_relative './item'
require_relative './label'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :label

  def initialize(publish_date, publisher, cover_state, label = '')
    super(publish_date)
    @label = label
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [publish_date, publisher, cover_state, label]
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
