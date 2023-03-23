module LabelList
  def label_list
    if @labels.empty?
      puts 'Please add some labels.  No labels available.'
    else
      puts 'Labels on our list:'
      @labels.map do |label|
        puts "Title: #{label['title']}, Color: #{label['color']} \n"
      end
    end
  end
end
