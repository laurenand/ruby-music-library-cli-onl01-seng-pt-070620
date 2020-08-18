class Genre 
  attr_accessor :name 
  
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
    @@all << self 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(genre) 
    self.new(genre).tap {|new_genre| new_genre.save}
  end
  
  def songs
    @songs
  end 
  
  
end