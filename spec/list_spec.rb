require('rspec')
require('list')

describe('List') do
  describe('#name') do
    it('return the name of the list') do
    newlist = List.new({:name => "garden"})
    expect(newlist.name()).to(eq("garden"))
    end
  end

  describe('#due_date') do
    it('return the due date of a list') do
      newlist = List.new({:due_date => "monday"})
      expect(newlist.due_date()).to(eq("monday"))
    end
  end

  describe('.all') do
    it('will show all the tasks') do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the tasks in the class variable') do
      newlist = List.new({:name => "garden"})
      newlist.save()
      expect(List.all()).to(eq([newlist]))
    end
  end

  describe('.clear') do
    it('will clear all tasks from the class variable') do
      List.new({:name => "garden"}).save()
      List.clear()
      expect(List.all()).to(eq([]))
    end
  end
end
