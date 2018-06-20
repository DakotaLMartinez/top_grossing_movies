class TopGrossingMovies::CLI
  def call
    puts "I'm scraping the top movies"
    TopGrossingMovies::Movie.all
  end
end
