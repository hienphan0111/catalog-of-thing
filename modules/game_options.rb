require_relative '../components/game'
require_relative '../utils/file_io'
require_relative '../components/author'
require 'json'

class GameOptions
  attr_reader :games, :authors

  def initialize()
    @file_games = IOFile.new('./database/games.json')
    @file_authors = IOFile.new('./database/authors.json')

    @games = @file_games.read_data
    @authors = @file_authors.read_data
  end

  def add_game()
    print 'Name: '
    name = gets.chomp
    print 'Publish date: '
    publish_date = gets.chomp
    print 'Multiplayer: '
    multiplayer = gets.chomp
    print 'Last played at: '
    last_played_at = gets.chomp
    print 'Enter [S] to select author from the list or [N] to create new once: '
    key = gets.chomp.upcase
    author = handle_author(key)
    game = Game.new(publish_date, name, multiplayer, last_played_at, author)
    @games << game
    @file_games.write_data(@games)
    puts 'The game was added successfully'
    puts
  end

  def handle_author(key)
    case key
    when 'S'
      puts 'Select author by enter the order number of following list '
      list_all_authors
      num = gets.chomp.to_i
      @authors[num]
    when 'N'
      create_new_author
    end
  end

  def create_new_author
    print 'First name: '
    first_name = gets.chomp
    print 'Last Name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    @file_authors.write_data(@authors)
    author
  end

  def list_all_games
    if @games.empty?
      puts 'There are no books in collection'
    else
      @games.each_with_index do |game, i|
        print "#{i}) Name: #{game.name}, Multiplayer: #{game.multiplayer} Last played at: #{game.last_played_at} "
        print "Author: #{game.author.first_name} \n"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'There are no labels in collection'
    else
      @authors.each_with_index do |author, i|
        puts "#{i}) ID: #{author.id}, First name: #{author.first_name}, Last name: #{author.last_name}"
      end
    end
  end
end
