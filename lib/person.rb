class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

julie = Person.new(12, 'julie', parent_permission: false)
p julie
p julie.can_use_services?

pierre = Person.new(22, 'Pierre')
p pierre
p pierre.can_use_services?
