class Genre
  attr_accessor :items
  attr_reader :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [name]
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
