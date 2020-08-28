# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class
require 'pry'

class User

    @@all = []

    attr_accessor :username

    def initialize(username)
        @username = username
        @@all << self
    end

    def self.all
        @@all
    end

    def photos
        Photo.all.select {|photo| photo.user == self}
    end

end

class Photo
    attr_accessor :user, :comments

    @@all = []

    def initialize
        @@all << self
        @comments = []
    end

    def self.all
        @@all
    end

    def make_comment(comment)
        @comments << comment 
    end


end

class Comment
    attr_accessor :user, :message, :photo

    @@all = []
    
    def initialize(user, message, photo)
        @user = user
        @message = message
        @photo = photo
        @@all << self
    end

    def self.all
        @@all
    end

end

sandwich_photo = Photo.new
sophie = User.new("Sophie")
hi = Comment.new("Sophie", "hi", sandwich_photo)

sandwich_photo.user = sophie

binding.pry

# sandwich_photo.user.username # => "Sophie"
# sophie.photos # => [#<Photo:0x00007fae2880b370>]
# sandwich_photo.comments # => []
# sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
# Comment.all #=> [#<Comment:0x00007fae28043700>]
# sandwich_photo.comments
# # => [#<Comment:0x00007fae28043700>]