class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def artist_count
    self.songs.select{|s|s.artist}.uniq.count
  end

  def all_artist_names
    self.artists.map{|s|s.name}.uniq
  end
end
