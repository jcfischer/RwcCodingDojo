class Monkey
  def initialize(step)
    @step = step
  end
  
  def process(doors)
    doors.each_with_index{|door, index| door.flip if (index+1) % @step == 0}
  end
end