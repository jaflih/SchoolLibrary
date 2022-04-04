require_relative 'person'

class Student < Person
  def initialize(id, age, name, parent_permission, classroom)
    @classroom = classroom
    super(id, age, name, parent_permission: parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

remy = Student.new(3, 24, 'Remy', true, 'classroom')
p remy
p remy.play_hooky
