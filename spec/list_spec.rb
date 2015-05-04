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
end
