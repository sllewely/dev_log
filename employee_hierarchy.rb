# input: pairs of (number of employees, level of those employees)
# every employee has exactly 1 manager, who must be at least 1 rank higher
# each employee cannot have more underlings than their level number

# find the min level CEO that must be hired to cover all of these

# employees = [[5, 0], [4, 1], [1, 5], [5, 2], [3, 3]]
employees = [[5, 0], [4, 1], [6, 5], [5, 2], [3, 3]]

class Employee

  def initialize(rank)
    @rank = rank
    @underlings = []
  end

  attr_accessor :rank, :underlings

  # returns true and places an employee if possible, else false
  def place?(employee)
    # employee can only be placed under someone of a higher rank
    return false unless employee.rank < @rank
    # try to place under someone
    return true if @underlings.any? { |underling| underling.place?(employee) }
    if @underlings.size < rank
      @underlings << employee
      return true
    end
    false
  end

  def to_s
    "{#{rank} -> (#{@underlings.map(&:to_s).join(', ')})}"
  end

  def min_ceo_rank
    # must be 1 greater than the highest underling rank
    [(@underlings.map(&:rank).max + 1), @underlings.size].max

  end

end

def build_trees(employees)
  # start with the highest rank employees and make roots out of them
  ceo = Employee.new(1000000000)
  while employees.size > 0
    i, rank = employees.each_with_index.each_with_object([0, 0]) do |((_count, rank), i), max|
      # max is (max_index, max_rank)
      # tttttttk777ttttttt7 - jasmine says
      puts "#{rank} against #{max[1]}"
      if rank > max[1]
        max[0] = i
        max[1] = rank
        # max = [i, rank] doesn't work with each_with_object
        puts "max is now #{max}"
      end
    end

    puts "highest set: #{employees[i]}"
    (count, rank) = employees.delete_at(i)
    puts "ceo rank is #{ceo.rank}"

    count.times { ceo.place?(Employee.new(rank)) }
  end

  puts ceo
  puts "underlings: #{ceo.underlings.map { |u| u.rank }.join(' ')}"
  ceo
end

ceo = build_trees(employees)
puts "min rank is #{ceo.min_ceo_rank}"

