require 'rubygems'
require 'spec'

require File.join(File.dirname(__FILE__), '..', 'lib', 'doors')
require File.join(File.dirname(__FILE__), '..', 'lib', 'monkey')

context Doors do
  it "should have 100 Doors" do
    Doors.doors.size.should==100
  end

  it "should have all doors closed" do
    Doors.doors.all? { |door| door.closed? }.should be_true
  end
  
  its(:class) { should respond_to(:run) }
  
  its(:class) { should respond_to(:pass_step)}
  
  it "should be possible to pass step for 2" do
    Doors.pass_step(2)
    Doors.doors[1].should be_open
  end
end

context Door do
  it "should be closed" do
    @door = Door.new
    @door.should be_closed
  end
  
  it "should be flippable from closed to open" do
    @door = Door.new
    @door.flip
    @door.should be_open
  end
  it "should be flippable from open to closed" do
    @door = Door.new
    @door.flip
    @door.should be_open
    @door.flip
    @door.should be_closed
  end
end

context Monkey do
  
  it "should accept a task assignment for every door" do
    @monkey = Monkey.new(1)
    @doors = [Door.new, Door.new]
    @monkey.process(@doors)
    @doors.all?{|door| door.open?}
  end
  it "should accept a task assignment for every second door" do
    @monkey = Monkey.new(2)
    @doors = [Door.new, Door.new]
    @monkey.process(@doors)
    @doors.first.should be_closed
    @doors.last.should be_open
  end
end