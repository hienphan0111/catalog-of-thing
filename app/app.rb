require_relative '../utils/file_io'
require_relative '../modules/book_options'
require_relative '../modules/music_module'
require_relative '../modules/game_options'

class App
  MENU = %(
  CHOOSE THE FOLLOWING COMMAND BY ENTERRING THE NUMBER:
  1. List all books
  2. List all music albums
  3. List all games
  4. List all genres (e.g. 'Comedy, 'Thriller')
  5. List all labels (e.g. 'Gift', 'New')
  6. List all authors (e.g. 'Stephen King')
  7. Add a book
  8. Add a music album
  9. Add a game
  10. Exit app
  ).freeze

  def initialize
    @book_options = BookOptions.new
    @music_options = MusicModule.new
    @game_options = GameOptions.new
  end

  def show_menu
    puts MENU
  end

  def run(cmd_key)
    if cmd_key.to_i.positive? && cmd_key.to_i <= 6
      list_items(cmd_key)
    elsif cmd_key.to_i > 6 && cmd_key.to_i <= 9
      add_item(cmd_key)
    else
      puts 'Your key input is invalid! Try again'
    end
  end

  def list_items(cmd_key)
    case cmd_key
    when '1'
      @book_options.list_all_books
    when '2'
      @music_options.list_all_music_albums
    when '3'
      @game_options.list_all_games
    when '4'
      @music_options.list_all_genres
    when '5'
      @book_options.list_all_labels
    when '6'
      @game_options.list_all_authors
    end
  end

  def add_item(cmd_key)
    case cmd_key
    when '7'
      puts @book_options.add_book
    when '8'
      @music_options.add_album
    when '9'
      @game_options.add_game
    end
  end
end
