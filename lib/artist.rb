class Artist
    attr_accessor :name
    attr_reader :songs

    @@all = []
    def initialize(name)
        @name = name
        @songs = []

        @@all << self
    end

    def songs
        Song.all.select{|title| title.artist == self}
    end
    
    def self.all
        @@all
    end

    def add_song(song)
        # takes in Song Object
        song.artist = self
        self.songs << song
    end

    def add_song_by_name(song_name)
        song = Song.new(song_name)
        add_song(song)
    end

    def self.song_count
        total_num = 0
        self.all.each { |artist| total_num += artist.songs.length}
        total_num
    end


end