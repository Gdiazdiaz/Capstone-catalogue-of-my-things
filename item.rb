require 'securerandom'
require 'date'

class Item
  attr_accessor :publish_date, :archived
  attr_reader :id, :genre, :author, :label

  def initialize(publish_date:)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  # def initialize(publish_date:)
  #   @id = SecureRandom.hex(10)
  #   @publish_date = publish_date
  #   @archived = archived
  #   @source = nil
  # end

  # attr_accessor :genre, :author, :label, :source, :publish_date, :archived

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_source(source)
    @source = source
    return if source.nil?

    source.items.push(self) unless source.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  private

  def can_be_archived?
    # return true if Date.strptime(@publish_date, '%d/%m/%Y') < Date.today - 3652

    # false
    (Date.today - Date.parse(@publish_date)).to_i / 365 > 10
  end
end
