module BookModule
  def load_books
    books_data = HandleData.new('book')
    @books = []
    @labels = []
    books_data.read.map do |book|
      new_book = Book.new(publish_date: book['publish_date'], publisher: book['publisher'],
                          cover_state: book['cover_state'])
      label = Label.new(title: book['label']['title'], color: book['label']['color'])
      label.add_item(new_book)
      @labels.push(label)
      @books.push(new_book)
    end
  end

  def book_list
    if @books.empty?
      puts 'No Book, try to add new one'
    else
      puts 'Book on our list:'
      @books.map do |book|
        puts "#{book.publish_date}, #{book.publisher}, #{book.cover_state}"
      end
    end
  end

  def label_list
    if @labels.empty?
      puts 'No Label'
    else
      puts 'Labels on our list:'
      @labels.map do |label|
        puts "#{label.title} , #{label.color}"
      end
    end
  end

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
    label.add_item(book)
    @books.push(book)
    puts 'Book added successfully'
  end

  def save_book(books)
    book_json = []
    books.map do |book|
      book_json.push({
                       id: book.id,
                       archived: book.archived,
                       cover_state: book.cover_state,
                       publish_date: book.publish_date,
                       label: {
                         id: book.label.id,
                         title: book.label.title,
                         color: book.label.color
                       }
                     })
    end
    HandleData.new('book').write(book_json)
  end
end
