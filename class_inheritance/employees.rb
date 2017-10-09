class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(options)
    @name = options[:name]
    @title = options[:title]
    @salary = options[:salary]
    @boss = options[:boss]
    @boss.add_subordinate(self) unless @boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :subordinates

  def initialize(options)
    super
    @subordinates = options[:subordinates]
  end

  def add_subordinate(employee)
    @subordinates << employee
  end

  def bonus(multiplier)
    bonus = 0
    @subordinates.each do |subor|
      bonus += subor.bonus(multiplier)
      bonus += subor.salary * multiplier if subor.is_a?(Manager)
    end
    bonus
  end
end
