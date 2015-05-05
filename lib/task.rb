class Task
  @@all_tasks = []
  attr_reader(:description,:level,:lists_id)

  define_method(:initialize) do |attributes|
    @description = attributes[:description]
    @level = attributes[:level]
    @lists_id = attributes[:lists_id]
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      level = task.fetch("level")
      description = task.fetch("description")
      lists_id = task.fetch("lists_id")
      tasks.push(Task.new({:description => description, :lists_id => lists_id}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, level, lists_id) VALUES ('#{@description}', null, #{@lists_id});")
 end

 define_method(:==) do |another_task|
     self.description().==(another_task.description())
   end

end
