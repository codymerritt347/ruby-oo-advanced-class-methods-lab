class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.find do |id|
      id.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    filename_to_array = filename.chomp(".mp3").split(" - ")
    new_song = self.new
    new_song.name = filename_to_array[1]
    new_song.artist_name = filename_to_array[0]
    new_song
  end

  def self.create_from_filename(filename)
    filename_to_array = filename.chomp(".mp3").split(" - ")
    new_song = self.new
    new_song.name = filename_to_array[1]
    new_song.artist_name = filename_to_array[0]
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end