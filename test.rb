require_relative './utils/file_io'
require_relative './modules/book_options'
require_relative './components/book'
require_relative './components/label'

require 'json'

file = IOFile.new('./database/labels.json')

data = file.read_data
data.each { |item| puts item.color } 

#puts JSON.parse(data, create_additions: true)
