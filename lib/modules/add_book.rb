module AddBook
  def add_book
    puts "Let's create a book"
    puts "Can we have this book's title?"
    title = gets.chomp
    puts "Can we have this book's author's first name?"
    author_f = gets.chomp
    puts "Can we have this book's author's last name?"
    author_l = gets.chomp
    puts "Can we have this book's publish date?"
    p_date = gets.chomp
    puts "Can we have this book's publisher?"
    publisher = gets.chomp
    puts "Can we have this book's cover state?"
    c_state = gets.chomp
    puts "Can we have this book's cover color?"
    c_color = gets.chomp
    label = Label.new(title, c_color)
    book = Book.new(p_date, publisher, c_state)
    author = Author.new(author_f, author_l)
    book_obj = {
      'id' => book.id, 'title' => label.title, 'publish_date' => book.publish_date,
      'publisher' => book.publisher, 'cover_state' => book.cover_state,
      'archived' => book.archived, 'author_f' => author.first_name, 'author_l' => author.last_name
    }
    label_obj = {
      'id' => label.id,
      'title' => label.title,
      'color' => label.color
    }
    @books.push(book_obj)
    @labels.push(label_obj)
    puts 'Book added successfully'
  end
end
