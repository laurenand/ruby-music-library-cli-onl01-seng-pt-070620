class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end
  
  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    user_input = ""
    until user_input == "exit"
      puts "What would you like to do?"
      user_input = gets.chomp
      case user_input
      when "list songs"
        self.list_songs 
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres 
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre 
      when "play song"
        self.play_song
      end 
    end
  end
  
  def list_songs 
    sorted_songs = Song.all.sort {|a, b| a.name <=> b.name}
    sorted_songs.each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    sorted_artists = Artist.all.sort {|a, b| a.name <=> b.name}
    sorted_artists.each_with_index {|artist, i| puts "#{i + 1}. #{artist.name}"}
   
  end
binding.pry
end 