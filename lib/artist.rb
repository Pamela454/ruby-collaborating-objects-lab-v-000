class Artist
  attr_accessor :name, :songs

  @@all = []    #class variable that keeps track of each new artist generated.

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []        #instance variable that keeps track of new songs generated.
  end

  def add_song(songs)
    @songs << songs    #stores songs for a particular artist. 
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)    #defining a class method. Can access all instances stored.
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.create(name)     #defining a class method. Can access all instances stored.
    self.new(name).tap {|artist| artist.save}
  end

  def self.find(name)      #defining a class method. Can access all instances stored.
    self.all.find {|artist| artist.name == name }
  end

  def print_songs
    songs.each {|song| puts song.name}
  end
end
