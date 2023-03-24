module MovieModule
  def load_movies
    @movies = []
    @sources = []
    movies_data = HandleData.new('movies')
    movies_data.read.map do |movie|
      new_movie = Movie.new(publish_date: movie['publish_date'], silent: movie['silent'])
      source = Source.new(name: movie['source']['name'])
      new_movie.add_source(source)
      @movies.push(new_movie)
      @sources.push(source)
    end
  end

  def movie_list
    if @movies.empty?
      puts 'No Movies, try to add new one'
    else
      puts 'Movies on our list:'
      @movies.map do |movie|
        puts "Publish Date: #{movie.publish_date} | Silent: #{movie.silent}, #{movie.source.name}"
      end
    end
  end

  def source_list
    if @sources.empty?
      puts 'No Sources, please add a movie with Source'
    else
      puts 'Sources List:'
      @sources.map do |source|
        puts source.name
      end
    end
  end

  def add_movie
    puts "Let's create a a movie"
    puts 'When was the movie published? (YYYY-MM-DD)'
    p_date = gets.chomp
    puts 'Is Silent? Yes | No'
    silent = gets.chomp
    sil = silent == 'Yes'
    puts 'What is the source:'
    source_name = gets.chomp

    new_movie = Movie.new(publish_date: p_date, silent: sil)
    source = Source.new(name: source_name)
    new_movie.add_source(source)
    @movies.push(new_movie)
    @sources.push(source)
    puts 'Movie added successfully'
  end

  def save_movies(movies)
    movies_json = []
    movies.map do |movie|
      movies_json.push({
                         id: movie.id,
                         archived: movie.archived,
                         publish_date: movie.publish_date,
                         source: {
                           id: movie.source.id,
                           name: movie.source.name
                         }
                       })
    end
    HandleData.new('movies').write(movies_json)
  end
end
