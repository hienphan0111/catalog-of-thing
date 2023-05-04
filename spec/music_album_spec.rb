require_relative 'spec_helper'

describe MusicAlbum do

  before :each do
    @music_album = MusicAlbum.new('Album',true,'2002-10-13')
    @genre = Genre.new('Rock')
  end

  describe "#new" do
    it "return a new book object" do
      @music_album.should be_an_instance_of MusicAlbum
    end
  end

  describe "#publish_date" do
    it "returns the correct publish date" do
      @music_album.publish_date.should eql Date.parse("2002-10-13")
    end
  end

  describe "#bublisher" do
    it "returns the correct title" do
      @music_album.name.should eql "Album"
    end
  end

  it "return true when on spotify is 'y' " do
    @music_album.can_be_archived?().should be true
  end

end
