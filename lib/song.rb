require 'pry'
class Song
    @@all = []
    @@count = 0
    @@artists = []
    @@genres = []

    attr_accessor :name, :artist, :genre

    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre

        self.class.all << self

        @@count += 1
        @@artists << @artist
        @@genres << @genre
    end

    def self.all
        @@all
    end

    def self.count
        @@count
    end

    def self.artists
        @@artists.uniq
    end

    def self.genres
        @@genres.uniq
    end

    def self.genre_count
        @@genres.group_by{|genre| genre}.map{|key, value| [key, value.size]}.to_h
    end

    def self.artist_count
        @@artists.group_by{|artist| artist}.map{|key, value| [key, value.size]}.to_h
    end
end