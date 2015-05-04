require('rspec')
require('list')

describe('List') do
  describe('#name') do
    it('return the name of the list') do
    newlist = List.new({:name => "garden"})
    expect(newlist.name()).to(eq("garden"))
  end
end
end
