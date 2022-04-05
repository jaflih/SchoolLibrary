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
    book = gets.chomp
    puts 'Select a person from the following list by number'
    person = gets.chomp
    print 'Date : '
    date = gets.chomp
    puts 'Rental created successfully '
    puts
  end

  def list_rental_person
    print 'ID of person : '
    id = gets.chomp
    puts 'Rentals : '
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

  def list_all_books
    @app.list_all_books.each do |b|
      puts "Title: \"#{b.title}\", Author: #{b.author}"
    end
  end

  def main
    puts 'Welcome to School Library App!'
    puts

    option = 0

    loop do
      menu
      option = gets.chomp

      case option
      when '1'
        list_all_books
      when '3'
        create_a_person
      when '4'
        create_a_book
      when '5'
        create_a_rental
      when '6'
        list_rental_person
      when '7'
        break
      else
        puts 'Option unknown'
      end
    end

    puts 'Thank you for using this app!'
  end
end

Main.new.main
