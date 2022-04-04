require_relative 'person'

class Teacher < Person
  def initialize(id, age, specialization, name = 'Unknown', parent_permission: true)
    @specialization = specialization
    super(id, age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end

timmy = Teacher.new(4, 12, 'specialization', 'Timmy', parent_permission: false)
p timmy
p timmy.can_use_services?
