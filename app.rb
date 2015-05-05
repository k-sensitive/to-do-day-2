require('sinatra')
require('sinatra/reloader')
require('./lib/task')
require('./lib/list')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => 'to_do'})

get('/') do
  erb(:index)
end

get('/list/new') do
  erb(:list_form)
end

post('/lists') do
  name = params.fetch('name')
  @lists = List.new({:name => name, :id => nil})
  @lists.save()
  erb(:success)
end

get('/lists') do
  @lists = List.all()
  erb(:lists)
end

get('/lists/:id') do
  @list = List.find(params.fetch('id').to_i())
  erb(:list)
end

get('/lists/:id/task/new') do
  @list = List.find(params.fetch('id').to_i())
  erb(:task)
end

post('/lists/:id/task') do
  lists_id = params.fetch('lists_id').to_i()
  @list = List.find(lists_id)
  description = params.fetch('description')
  @task = Task.new({:description => description, :lists_id => lists_id})
  @task.save()
  erb(:success)
end
