require 'pry'
class Artist
    attr_reader :name 
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select {|song_obj| song_obj.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def add_song_by_name(song_name)
        new_song = Song.new(song_name)
        new_song.artist = self
    end

    def self.song_count
        total = 0
         @@all.each do |artist_obj|
            total += artist_obj.songs.count 
         end
         total
    end


end