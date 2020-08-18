class Artist 
  attr_accessor :name
  attr_reader :songs
  
  
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self 
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(artist) 
    self.new(artist).tap {|new_artist| new_artist.save}
  end
  
  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song unless @songs.include?(song)
  end
  
  def songs
    @songs
  end
  
  def genres 
    self.songs.collect {|song| song.genre}.uniq
  end
   
end

