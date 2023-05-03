require_relative 'spec_helper'

describe Label do

  before :each do
    @label = Label.new('Gift', 'green')
    @item = Item.new('2023-10-10')
  end

  describe "#new" do
    it "return a new book object" do
      @label.should be_an_instance_of Label
    end
  end

  describe "#title" do
    it "returns the correct name" do
      @label.title.should eql 'Gift'
    end
  end

  describe "#color" do
    it "returns the correct color" do
      @label.color.should eql "green"
    end
  end

end
