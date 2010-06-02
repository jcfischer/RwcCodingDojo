class Doors

  def self.doors
    [Door.new] * 100
  end
  
  def self.run
    
  end
  
  
  def self.pass_step(step)
  
  end
  
  
end

class Door
  
  def initialize
    @open = false
  end
  
  def closed?
    !open?
  end
  
  def open?
    @open
  end
  
  def flip
    @open = !@open
  end
end