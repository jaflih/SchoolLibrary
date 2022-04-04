require_relative 'lib/person'
require_relative 'lib/capitalize_decorator'
require_relative 'lib/trimmer_decorator'
require_relative 'lib/classroom'
require_relative 'lib/student'
require_relative 'lib/book'
require_relative 'lib/rental'

person = Person.new(22, 12, 'maximilianus')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name

classroom = Classroom.new('mathematic')

sarrah = Student.new(1, 20, nil, 'Sarrah')
john = Student.new(2, 20, nil, 'John')
ines = Student.new(3, 20, nil, 'Ines')

classroom.add_student(sarrah)
classroom.add_student(ines)

classroom.students.each do |e|
  print e.name, ' '
end
puts
p 'Sarrah classroom :', sarrah.classroom.label

p 'John classroom :', john.classroom

p 'John classroom :', john.classroom.label unless john.classroom.nil?

john.classroom = classroom
p 'John classroom :', john.classroom.label

book = Book.new('MyBook', 'Garibaldy')
book2 = Book.new('MyBook2', 'Garibaldy')
book3 = Book.new('MyBook3', 'Garibaldy')
Rental.new('12/12/2000', book, ines)
Rental.new('12/12/2000', book2, ines)
Rental.new('12/12/2000', book3, ines)

p 'Ines books : '
ines.rentals.each do |r|
  print r.book.title, ' '
end
