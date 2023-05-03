require_relative '../components/book'
require_relative '../utils/file_io'
require_relative '../components/label'
require 'json'

class BookOptions
  attr_reader :books, :label

  def initialize()
    @file_books = IOFile.new('./database/books.json')
    @file_labels = IOFile.new('./database/labels.json')

    @books = @file_books.read_data
    @labels = @file_labels.read_data
  end

  def add_book()
    print 'Publish_date: '
    publish_date = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state: '
    cover_state = gets.chomp
    print 'Enter [S] to select label from the list or [N] to create new once: '
    key = gets.chomp.upcase
    label = handle_label(key)
    book = Book.new(publish_date, publisher, cover_state)
    book.label = label
    @books << book
    @file_books.write_data(@books)
    puts 'The book was added successfull'
    puts
  end

  def handle_label(key)
    case key
    when 'S'
      puts 'Select label by enter the order number of following list '
      list_all_labels
      num = gets.chomp.to_i
      @labels[num]
    when 'N'
      create_new_label
    end
  end

  def create_new_label
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    label = Label.new(title, color)
    @labels << label
    @file_labels.write_data(@labels)
    label
  end

  def list_all_books
    if @books.empty?
      puts 'There are no books in collection'
    else
      @books.each_with_index do |book, i|
        puts "#{i}) ID: #{book.id}, Publish date: #{book.publish_date} Publisher: #{book.publisher} #{book.cover_state}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'There are no labels in collection'
    else
      @labels.each_with_index { |label, i| puts "#{i}) ID: #{label.id}, Title: #{label.title}, Color: #{label.color}" }
    end
  end
end
