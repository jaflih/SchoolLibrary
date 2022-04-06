require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def create_a_student
    print 'Age : '
    age = gets.chomp
    print 'Name : '
    name = gets.chomp
    print 'Has parent permission ? [Y/N] '
    permission = gets.chomp
    puts 'Person created successfully '
    puts
    @app.create_a_student(name, age, permission)
  end

  def create_a_teacher
    print 'Age : '
    age = gets.chomp
    print 'Name : '
    name = gets.chomp
    print 'Specialization : '
    specialization = gets.chomp
    puts 'Person created successfully '
    puts
    @app.create_a_teacher(name, age, specialization)
  end

  def create_a_person
    loop do
      puts 'Do you want to create a student (1) or a teacher (2)? [Input the number] :'
      option = gets.chomp
      case option
      when '1'
        create_a_student
        break
      when '2'
        create_a_teacher
        break
      else
        puts 'Option unknown'
      end
    end
  end

  def create_a_book
    print 'Title : '
    title = gets.chomp
    print 'Auhor : '
    author = gets.chomp
    @app.create_a_book(title, author)
    puts 'Book created successfully '
    puts
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    list_all_books(with_id: true)
    book = gets.chomp
    puts 'Select a person from the following list by number (not id)'
    list_all_persons(with_id: true)
    person = gets.chomp
    print 'Date : '
    date = gets.chomp
    puts 'Rental created successfully '
    puts
    @app.create_a_rental(date, book.to_i, person.to_i)
  end

  def list_rental_person
    print 'ID of person : '
    id = gets.chomp
    puts 'Rentals : '
    rentals = @app.list_rental_person(id.to_i)
    rentals&.each do |r|
      puts "Date: \"#{r.date}\", Book: #{r.book.title} by #{r.book.author}"
    end
    puts
  end

  def menu
    puts 'Please choose an option by enterin a number :'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def list_all_books(with_id: false)
    if with_id
      @app.list_all_books.each.with_index(0) do |b, i|
        puts "#{i}) Title: \"#{b.title}\", Author: #{b.author}"
      end
    else
      @app.list_all_books.each do |b|
        puts "Title: \"#{b.title}\", Author: #{b.author}"
      end
    end
    puts
  end

  def list_all_persons(with_id: false)
    if with_id
      @app.list_all_persons.each.with_index(0) do |p, i|
        puts "#{i}) [#{p.class}] Name: \"#{p.name}\", ID: #{p.id}, Age: #{p.age}"
      end
    else
      @app.list_all_persons.each do |p|
        puts "[#{p.class}] Name: \"#{p.name}\", ID: #{p.id}, Age: #{p.age}"
      end
    end
    puts
  end

  def main
    puts 'Welcome to School Library App!'
    puts

    opts = ['none', :list_all_books, :list_all_persons, :create_a_person, :create_a_book, :create_a_rental,
            :list_rental_person]

    option = 0

    loop do
      menu
      option = gets.chomp
      break if option == '7'

      if option.to_i.positive? && option.to_i < 7
        c = opts[option.to_i]
        send(c)
      else
        puts 'Option unknown'
      end
    end
    puts 'Thank you for using this app!'
  end
end

Main.new.main
