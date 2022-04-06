require_relative 'lib/person'
require_relative 'lib/capitalize_decorator'
require_relative 'lib/trimmer_decorator'
require_relative 'lib/classroom'
require_relative 'lib/student'
require_relative 'lib/book'
require_relative 'lib/rental'
require_relative 'lib/teacher'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
    @id = 0
  end

  def list_all_books
    @books
  end

  def list_all_persons
    @persons
  end

  def create_a_book(title, author)
    @books.push(Book.new(title, author))
  end

  def create_a_student(name, age, parent_permission)
    @persons.push(Student.new((@id * 100) + 10, age, nil, name, parent_permission: parent_permission))
    @id += 1
  end

  def create_a_teacher(name, age, specialization)
    @persons.push(Teacher.new(@id, age, specialization, name, parent_permission: true))
    @id += 1
  end

  def create_a_rental(date, book_id, person_id)
    @rentals.push(Rental.new(date, @books[book_id], @persons[person_id]))
  end

  def list_rental_person(id)
    @persons.each do |p|
      return p.rentals if p.id == id
    end
    nil
  end
end
