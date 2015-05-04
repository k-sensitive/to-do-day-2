class List
  @@all_lists = []
  attr_reader(:name,:due_date)


  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @due_date = attributes[:due_date]
  end

  define_singleton_method(:all) do
    @@all_lists
  end

  define_method(:save) do
    @@all_lists.push(self)
  end

  define_singleton_method(:clear) do
    @@all_lists = []
  end
end
