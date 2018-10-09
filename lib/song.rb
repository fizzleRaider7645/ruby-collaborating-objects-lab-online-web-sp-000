class Song
  attr_accessor :name, :artist
  
  def initialize(name)
    @name = name
  end
  
  def self.new_by_filename(filename)
    parsed = filename.split(" - ")
    artist_name = parsed[0]
    title = parsed[1]
    new_song = self.new(title)
    # new_artist = Artist.new(artist_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_artist.save
    new_song
  end
end