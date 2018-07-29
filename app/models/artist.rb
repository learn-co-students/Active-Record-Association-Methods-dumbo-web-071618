class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    # Return the genre of the artist's first saved song
    self.songs.first.genre
  end

  def song_count
    # Return the number of songs associated with the artist
    self.songs.size
  end

  def genre_count
    # Return the number of genres associated with the artist
    self.genres.size
  end
end
