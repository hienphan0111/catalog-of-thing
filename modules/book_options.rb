require_relative '../components/book'
require_relative '../utils/file_io'
require_relative '../components/label'

class BookOptions
  attr_reader :books, :label

  def initialize
    @file = IOFile.new('./database/books.json')
    data = @file.read_data
    @books = data.empty? ? [] : data.books
    @labels = data.empty? ? [] : data.labels
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
    @file.write_data(self)
  end

  def handle_label(key)
    case key
    when 'S'
      puts 'Select label by enter the order number of following list '
      list_all_labels
      num = gets.chomp.to_i
      @label[num]
    when 'N'
      label = create_new_label
    end
  end

  def create_new_label
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    label = Label.new(title, color)
    @labels << label
    label
  end

  def list_all_books
    if @books.empty?
      puts 'There are no books in collection'
    else
      @books.each_with_index do |_book, _i|
        puts `${i}) ID: ${@book.id}, Publish date: ${book.publish_date} Publisher: ${book.publisher} ${book.cover_state}`
      end
    end
  end

  def list_all_labels
    @books.each_with_index { |_book, _i| puts `${i}) ID: ${@label.id}, Title: ${@label.title}, Color: ${@label.color}` }
  end
end
