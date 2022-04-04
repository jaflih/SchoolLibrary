require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

end

julie = Person.new(1, 12, 'julie', parent_permission: false)
p julie
p julie.can_use_services?
p julie.correct_name

pierre = Person.new(2, 22, 'Pierre')
p pierre
p pierre.can_use_services?
