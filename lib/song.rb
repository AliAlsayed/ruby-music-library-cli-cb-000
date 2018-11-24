class Song
  @@all = []
  attr_accessor :name, :artist
  attr_reader :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    #if artist
    self.artist = artist
    #end
    self.genre = genre
  end

  def self.all
    @@all
  end

  def genre=(genre)
    if genre
      @genre = genre
      genre.songs << self if !genre.songs.include?(self)
    end
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    if artist
      artist.add_song(self)
      @artist = artist
    end

  end
end
