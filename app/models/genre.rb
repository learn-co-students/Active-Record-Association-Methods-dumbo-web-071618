class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    Song.where(genre: self).count
  end

  def artist_count
    # return the number of artists associated with the genre
    Song.where(genre: self).order(:artist).uniq.count
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    artist_id_array = Song.where(genre: self).select(:artist_id).distinct

    artist_id_array.map do |artist_id|
      Artist.find(artist_id.artist_id).name
    end
  end
end
