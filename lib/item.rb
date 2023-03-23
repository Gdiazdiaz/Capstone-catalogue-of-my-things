require 'securerandom'
require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :publish_date
  attr_writer :genre, :source, :author, :label

  def initialize(publish_date:, archived: false, id: SecureRandom.hex(10))
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  # def genre=(genre)
  #   @genre = genre
  # end

  # def source=(source)
  #   @source = source
  # end

  # def author=(author)
  #   puts "addint author"
  #   @author = author
  # end

  # def label=(label)
  #   @label = label
  # end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today - Date.parse(@publish_date)).to_i / 365 > 10
  end
end
