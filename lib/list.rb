class List
  attr_reader(:name,:due_date)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @due_date = attributes[:due_date]
  end
end
