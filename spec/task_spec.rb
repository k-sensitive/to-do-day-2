require('rspec')
require('task')

describe('Task') do
  describe('#description') do
    it('will return the name of the task') do
      newtask = Task.new({:description => "Clean"})
      expect(newtask.description()).to(eq("Clean"))
    end
  end

  describe('#level') do
    it('will return the level of importance of the task') do
      newtask = Task.new({:level => "Important"})
      expect(newtask.level()).to(eq("Important"))
    end
  end

  describe('.all') do
    it('will show all the tasks') do
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the tasks in the class variable') do
      newtask = Task.new({:description => "Clean"})
      newtask.save()
      expect(Task.all()).to(eq([newtask]))
    end
  end

  describe('.clear') do
    it('will clear all tasks from the class variable') do
      Task.new({:description => "Clean"}).save()
      Task.clear()
      expect(Task.all()).to(eq([]))
    end
  end


end
