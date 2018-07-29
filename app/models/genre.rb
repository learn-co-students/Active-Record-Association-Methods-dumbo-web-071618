class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # Return the number of songs in a genre
    self.songs.size
  end

  def artist_count
    # Return the number of artists associated with the genre
    self.artists.size
  end

  def all_artist_names
    # Return an array of strings containing every musician's name
    self.artists.map { |artist| artist.name }
  end
end
