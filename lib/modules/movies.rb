module MovieModule
  def load_movies
    movies_data = HandleData.new('movies')
    movies_data.read.map do |movie|
      new_movie = Movie.new(publish_date: movie['publish_date'], silent: movie['silent'])
      source = Source.new(name: movie['source']['name'])
      source.add_item(new_movie)
      new_movie
    end
  end

  def movie_list
    if @movies.empty?
      puts 'No Movies, try to add new one'
    else
      puts 'Movies on our list:'
      @movies.map do |movie|
        puts "#{movie.publish_date}, #{movie.silent}"
      end
    end
  end

  def add_movie
    puts "Let's create a a movie"
    puts 'Can we have this Movie publish date?'
    p_date = gets.chomp
    puts 'Is Silent? true | false'
    silent = gets.chomp
    puts 'What is the source: '
    source_name = gets.chomp

    new_movie = Movie.new(publish_date: p_date, silent: silent)
    source = Source.new(name: source_name)
    source.add_item(new_movie)
    @movies.push(new_movie)
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
