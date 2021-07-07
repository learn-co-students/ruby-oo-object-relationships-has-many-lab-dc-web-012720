class Author
    attr_accessor :name
    attr_reader :posts

    @@all = []
    def initialize(name)
        @name = name
        @posts = []

        @@all << self
    end

    def posts
        Post.all.select{|title| title.author == self}
    end
    
    def self.all
        @@all
    end

    def add_post(post)
        post.author = self
    end

    def add_post_by_title(title)
        post = Post.new(title)
        add_post(post)
    end

    def self.post_count
        total_num = 0
        self.all.each {|author| total_num += author.posts.length}
        total_num
    end


end