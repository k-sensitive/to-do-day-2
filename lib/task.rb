class Task
  @@all_tasks = []
  attr_reader(:description,:level)

  define_method(:initialize) do |attributes|
    @description = attributes[:description]
    @level = attributes[:level]
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      level = task.fetch("level")
      description = task.fetch("description")
      tasks.push(Task.new({:description => description, :level => level}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, level) VALUES ('#{@description}', '#{@level}');")
 end

 define_method(:==) do |another_task|
     self.description().==(another_task.description())
   end

end
