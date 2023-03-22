module ListGenre
  def list_genres
    before_list_genre

    @genres.each_with_index do |genre, index|
      puts '--------------------------------------------'
      puts "  [Index]: #{index + 1}"
      puts "  ID: #{genre.id}"
      puts "  Name: #{genre.name}"
      puts '--------------------------------------------'
    end

    puts 'press enter to continue'
    gets
    system('clear')
    system('cls')
    start_app
  end

  def before_list_genre
    puts 'Hello User!, Wellcome Here is the list of Music Genre we have'
  end
end
