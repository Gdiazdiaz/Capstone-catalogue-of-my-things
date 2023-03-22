class Options
  def display
    puts 'Please type the number of your selection'
    option = gets.chomp.to_i
    select(option)
  end

  def select(option)
    choice = {
      1 => 'book_list', 2 => 'album_list', 3 => 'movie_list',
      4 => 'game_list', 5 => 'genre_list', 6 => 'label_list',
      7 => 'author_list', 8 => 'source_list', 9 => 'add_book',
      10 => 'add_album', 11 => 'add_movie', 12 => 'add_game',
      13 => 'exit'
    }
    case option
    when 1..13
      choice[option]
    else
      puts 'Invalid option'
    end
  end
end
