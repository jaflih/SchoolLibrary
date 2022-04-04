require_relative 'person'

class Student < Person
  def initialize(age, name, parent_permission, classroom)
    @classroom = classroom
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

remy = Student.new(24, 'Remy', true, 'classroom')
p remy
p remy.play_hooky
