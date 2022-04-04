require_relative 'person'

class Teacher < Person
  def initialize(age, name, parent_permission, specialization)
    @specialization = specialization
    super(age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end

timmy = Teacher.new(12, 'Timmy', false, 2)
p timmy
p timmy.can_use_services?
