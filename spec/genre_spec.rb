require_relative 'spec_helper'

describe Genre do
  before :each do
    @genre = Genre.new('Rock')
    @item = Item.new('2023-10-10')
  end

  describe '#new' do
    it 'return a new book object' do
      @genre.should be_an_instance_of Genre
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      @genre.name.should eql 'Rock'
    end
  end
end
