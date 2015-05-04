class Task
  @@all_tasks = []
  attr_reader(:description,:level)

  define_method(:initialize) do |attributes|
    @description = attributes[:description]
    @level = attributes[:level]
  end

  define_singleton_method(:all) do
    @@all_tasks
  end
  
end
