require_relative '../components/music_album'
require_relative '../components/genre'
require_relative '../utils/file_io'

class MusicModule
  def initialize
    @file_music_album = IOFile.new('./database/music_album.json')
    @file_genre = IOFile.new('./database/genre.json')
    @music_albums = @file_music_album.read_data
    @genres = @file_genre.read_data
  end

  def add_album
    print 'Enter album Name: '
    name = gets.chomp
    print 'Enter publish date: '
    publish_date = gets.chomp
    print 'is it on Spotify? [Y/N]: '
    on_spotify = gets.chomp.downcase
    on_spotify = on_spotify == 'y'
    print 'To Select genre from the list press [S] or create new one press [N] '
    key = gets.chomp.upcase
    genre = handle_genre(key)
    music_album = MusicAlbum.new(name, on_spotify, publish_date, genre)
    @music_albums << music_album
    @file_music_album.write_data(@music_albums)
    puts '*************** Music album was add successfully!!***************'
  end
  
    music_struct = ItemStruct.new(name:, genre:, publish_date:, on_spotify:)
    json = JSON.generate(music_struct)
    @musics << json
    File.write('musics.json', @musics)
=======
  def handle_genre(key)
    case key
    when 'S'
      list_all_genres
      num = gets.chomp.to_i
      @genres[num]
    when 'N'
      create_new_genre
    end
  end

  def create_new_genre
    print 'Enter name of genre: '
    name = gets.chomp
    genre = Genre.new(name)
    @genres << genre
    @file_genre.write_data(@genres)
    genre
  end

  def list_all_genres
    if @genres.empty?
      puts 'There are no genres'
    else
      puts 'All saved music'
      puts "---------------\n"
      @genres.each_with_index do |genre, index|
        puts "#{index + 1})  Name: #{genre.name} "
      end
    end
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No music currently saved'
    else
      puts 'All saved music'
      puts "---------------\n"
      @music_albums.each_with_index do |music, index|
        print "#{index + 1}) Name: #{music.name}, publish date: #{music.publish_date},"
        print " on spotify: #{music.on_spotify}, Genre: #{music.genre.name} \n"
      end
    end
  end
end
