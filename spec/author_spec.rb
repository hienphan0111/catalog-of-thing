require_relative 'spec_helper'

describe 'Autor Class:' do
  before :each do
    @author = Author.new('Yismake', 'Worku')
  end

  context 'New Author Class:' do
    it 'should have the following attributes (first name, last name, and id)' do
      expect(@author.first_name).to eql 'Yismake'
      expect(@author.last_name).to eql 'Worku'
    end
    it 'should be an instance of the class Author' do
      expect(@author).to be_instance_of Author
    end
  end
end
