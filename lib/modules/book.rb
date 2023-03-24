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
    puts '=========================================================='
    if @books.empty?
      puts 'No Book, try to add new one\n'
    else
      puts "\t\tBook on our list:"
      puts '--------------------------------------------------------'
      @books.each_with_index do |book, index|
        # p book
        puts "#{index + 1})
          label: #{book.label.title}
          Published Date: #{book.publish_date}
          Publisher: #{book.publisher}
          Cover State: #{book.cover_state}"
      end
    end
    puts '=========================================================='
  end

  def label_list
    puts '=========================================================='
    if @labels.empty?
      puts 'No Label \n'
    else
      puts "\t\tLabels on our list:"
      puts '--------------------------------------------------------'
      @labels.each_with_index do |label, index|
        puts "#{index + 1}
          Title: #{label.title}
          Color: #{label.color}"
      end
    end
    puts '=========================================================='
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
                       publisher: book.publisher,
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
