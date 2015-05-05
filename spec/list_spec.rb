require('spec_helper')

describe('List') do
  describe('#name') do
    it('return the name of the list') do
    newlist = List.new({:name => "garden"})
    expect(newlist.name()).to(eq("garden"))
    end
  end

  describe("#id") do
      it("sets its ID when you save it") do
        newlist = List.new({:name => "garden", :id => nil})
        newlist.save()
        expect(newlist.id()).to(be_an_instance_of(Fixnum))
      end
    end

  describe('.all') do
    it('will show all the lists') do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the lists in the class variable') do
      newlist = List.new({:name => "garden", :id => nil})
      newlist.save()
      expect(List.all()).to(eq([newlist]))
    end
  end

  describe("#==") do
      it("is the same list if it has the same name") do
        list1 = List.new({:name => "garden", :id => nil})
        list2 = List.new({:name => "garden", :id => nil})
        expect(list1).to(eq(list2))
      end
    end

end
