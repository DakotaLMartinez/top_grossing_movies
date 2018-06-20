class TopGrossingMovies::Movie
  attr_accessor :title, :description

  def initialize(title:, description:)
    @title = title
    @description = description
  end

  def self.all
    binding.pry
    @@all ||= self.scrape_movies.collect do |movie_hash|
      self.new(movie_hash)
    end
  end

  def details
    @details ||= self.scrape_details
  end

  def self.scrape_movies
    doc = Nokogiri::HTML(open('https://www.newsday.com/entertainment/movies/the-biggest-box-office-hits-of-all-time-1.5369007'))
    doc.css('.mediaCell').collect do |movie|
      {
        title: movie.css('h2').text,
        description: movie.css('p').text
      }
    end
  end

end
