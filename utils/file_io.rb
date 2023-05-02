require 'json'

class IOFile
  def initialize(file_name)
    @path = File.expand_path(file_name)
  end

  def read_data
    return [] unless File.exist?(@path)

    data = File.read(@path)
    json = data.split
    json.map { |item| JSON.parse(item, create_additions: true) }
  end

  def write_data(data)
    file = File.open(@path, 'w')
    json = data.map { |item| JSON.generate(item) }
    file.puts(json)
    file.close
  end
end
