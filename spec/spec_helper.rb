require('rspec')
require('list')
require('pg')

DB = PG.connect({:dbname => 'to_do_list'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM tasks *;")
  end
end
