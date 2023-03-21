require 'date'
require 'securerandom'

class MusicItem
  attr_accessor :publish_year, :is_archived
  attr_reader :id, :genre, :author, :label

  def initialize(publish_year = Date.today, id = SecureRandom.uuid, is_archived: false)
    @id = id
    @publish_year = publish_year
    @is_archived = is_archived
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def move_to_archive
    @is_archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today - Date.parse(@publish_year)).to_i / 365 > 10
  end
end
