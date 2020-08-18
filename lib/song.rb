require 'pry'
class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist != nil ? self.artist=(artist) : @artist = nil
    genre != nil ? self.genre=(genre) : @genre = nil
    save
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(song)
    self.new(song).tap {|new_song| new_song.save}
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end  
   
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
 
  
end