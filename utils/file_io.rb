require 'json'

class IOFile

  def initialize(file_name)
    @path = File.expand_path(file_name)
  end

  def read_data
    return [] unless File.exist?(@path)

    data = File.read(@path)
    data.empty? ? [] : JSON.parse(data, create_additions: true) 
    
  end

  def write_data(data)
    file = File.open(@path, 'w')
    json = JSON.generate(data)
    file.puts(json)
    file.close
  end
end
