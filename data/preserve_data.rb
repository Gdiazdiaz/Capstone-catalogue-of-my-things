def save_book(book, label)
  save_label(label)
  book_obj = {
    id: book.id, title: label.title, publish_date: book.publish_date,
    publisher: book.publisher, cover_state: book.cover_state,
    archived: book.archived
  }

  File.new('./data/book.json', 'w+') unless File.exist?('./data/book.json')

  file = File.open('./data/book.json')

  if file.read.empty?
    book = [book_obj]
  else
    book = JSON.parse(File.read('./data/book.json'))
    book << book_obj
  end

  file.close

  myfile = File.open('./data/book.json', 'w')
  myfile.write(JSON.pretty_generate(book))
  myfile.close
end

def save_label(label)
  label_obj = {
    id: label.id,
    title: label.title,
    color: label.color
  }

  File.new('./data/label.json', 'w+') unless File.exist?('./data/label.json')

  file = File.open('./data/label.json')

  if file.read.empty?
    label = [label_obj]
  else
    label = JSON.parse(File.read('./data/label.json'))
    label << label_obj
  end

  file.close

  myfile = File.open('./data/label.json', 'w')
  myfile.write(JSON.pretty_generate(label))
  myfile.close
end

def books_listed
  File.new('./data/book.json', 'w+') unless File.exist?('./data/book.json')
  file = File.open('./data/book.json')

  if File.empty?('./data/book.json')
    'Please add some books.  No books available.'
  else
    books = JSON.parse(File.read('./data/book.json'))
    puts 'Books on our list:'
    books.each do |book|
      puts "Title: #{book['title']}, Publisher: #{book['publisher']}"
    end
  end
  file.close
end

def labels_listed
  File.new('./data/label.json', 'w+') unless File.exist?('./data/label.json')
  file = File.open('./data/label.json')

  if File.empty?('./data/label.json')
    'Please add some labels.  No labels available.'
  else
    labels = JSON.parse(File.read('./data/label.json'))
    puts 'Labels on our list:'
    labels.each do |label|
      puts "Title: #{label['title']}, Color: #{label['color']}"
    end
  end
  file.close
end
