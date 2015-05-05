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
  @list = List.find(params.fetch('id').to_i())
  erb(:list)

end
