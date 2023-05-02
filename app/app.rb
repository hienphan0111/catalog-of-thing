require_relative '../utils/file_io'
require_relative '../modules/book_options'

class App
  MENU = %('
  CHOOSE THE FOLLOWING COMMAND BY ENTER THE NUMBER:
  1. List all books
  2. List all music albums
  3. List all movies
  4. List all genres (e.g. 'Comedy, 'Thriller')
  5. List all labels (e.g. 'Gift', 'New')
  6. List all authors (e.g. 'Stephen King')
  7. List all sources (e.g. 'From a friend', 'Online shop')
  8. Add a book
  9. Add a music album
  10. Add a movie
  11. Add a game
  12. Exit app
  ').freeze

  def initialize
    @bookOptions = BookOptions.new
  end

  def show_menu
    puts MENU
  end

  def run(cmd_key)
    if cmd_key.to_i.positive? && cmd_key.to_i <= 7
      list_items(cmd_key)
    elsif cmd_key.to_i > 7 && cmd_key.to_i <= 11
      add_item(cmd_key)
    elsif cmd_key == '12'
      puts 'Exit'
    else
      puts 'Your key input is invalid! Try again'
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def list_items(cmd_key)
    case cmd_key
    when '1'
      @bookOptions.list_all_books
    when '2'
      puts 'List all music albums'
    when '3'
      puts 'List all movies'
    when '4'
      puts "List all genres (e.g. 'Comedy, 'Thriller')"
    when '5'
      puts "List all labels (e.g. 'Gift', 'New')"
    when '6'
      puts "List all authors (e.g. 'Stephen King')"
    when '7'
      puts "List all sources (e.g. 'From a friend', 'Online shop')"
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity

  def add_item(cmd_key)
    case cmd_key
    when '8'
      puts @bookOptions.add_book
    when '9'
      puts 'add a music album'
    when '10'
      puts 'add a movie'
    when '11'
      puts 'add a game'
    end
  end
end
