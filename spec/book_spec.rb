require_relative 'spec_helper'

describe Book do

  before :each do
    @book = Book.new('2022-10-13', 'Publisher', 'good')
    @label = Label.new('Gift', 'green')
  end

  describe "#new" do
    it "return a new book object" do
      @book.should be_an_instance_of Book
    end
  end

  describe "#publish_date" do
    it "returns the correct publish date" do
      @book.publish_date.should eql Date.parse("2022-10-13")
    end
  end

  describe "#bublisher" do
    it "returns the correct title" do
      @book.publisher.should eql "Publisher"
    end
  end

  it "adds label for this book" do
    @book.label = @label
    @book.label.color.should eql 'green'
  end

  it "return true when cover is 'bad' " do
    @book.cover_state = 'bad'
    @book.can_be_archived?().should be true
  end

end
