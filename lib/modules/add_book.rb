module AddBook
  def add_book
    puts "Let's create a book"
    puts "Can we have this book's title?"
    title = gets.chomp
    puts "Can we have this book's publish date?"
    p_date = gets.chomp
    puts "Can we have this book's publisher?"
    publisher = gets.chomp
    puts "Can we have this book's cover state?"
    c_state = gets.chomp
    puts "Can we have this book's cover color?"
    c_color = gets.chomp
    label = Label.new(title: title, color: c_color)
    book = Book.new(publish_date: p_date, publisher: publisher, cover_state: c_state)
    save_book(book, label)
    puts 'Book added successfully'
  end
end