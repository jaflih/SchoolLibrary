require_relative 'lib/person'
require_relative 'lib/capitalize_decorator'
require_relative 'lib/trimmer_decorator'
require_relative 'lib/classroom'
require_relative 'lib/student'
require_relative 'lib/book'
require_relative 'lib/rental'

class App
  def initialize
    @books = []
  end

  def list_all_books
    @books
  end

  def create_a_book(title, author)
    @books.push(Book.new(title, author))
  end
end
