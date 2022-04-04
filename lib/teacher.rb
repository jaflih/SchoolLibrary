require_relative 'person'

class Teacher < Person
  def initialize(id, age, name, parent_permission, specialization)
    @specialization = specialization
    super(id, age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end

timmy = Teacher.new(4, 12, 'Timmy', false, 2)
p timmy
p timmy.can_use_services?
