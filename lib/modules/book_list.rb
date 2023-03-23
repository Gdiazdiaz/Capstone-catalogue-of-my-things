module BookList
  def book_list
    if @books.empty?
      puts 'Please add some books.  No books available.'
    else
      puts 'Books on our list:'
      @books.map do |book|
        puts "Title: #{book['title']}, Author: #{book['author_f']} #{book['author_l']}"
      end
    end
  end
end
