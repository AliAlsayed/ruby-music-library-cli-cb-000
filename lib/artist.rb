class Artist
  @@all = []
  attr_accessor :name, :songs, :genres
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def genres
    Song.all{|song| song.genre if song.artist == self}
  end

  def add_song(song)
    if !song.artist
      song.artist = self
      @songs << song
    end
  end
end
